import { NextFunction, Response } from "express";
import { WithId, Document } from "mongodb";
import { uuid } from "uuidv4";

import database from "../../loaders/database";
import errorClass from "../../shared/error";
import { compare, hash } from "bcrypt";
import { signJwt, verifyJwt } from "../../shared/services/jwtService";
import { UserRequest } from "./routes";

export const register = async (
  req: UserRequest,
  next: NextFunction,
  res: Response,
) => {
  try {
    const password = req.body.password;

    // Check for exisiting users
    const databaseResponse = await (await database())
      .collection("users")
      .findOne({ email: req.body.email });
    if (databaseResponse !== null)
      throw Error("Existing user with the same email");

    // Account number generation
    let card_no: number, cardMatch: WithId<Document> | null;
    const account_no = uuid();
    const cvv = Math.floor(Math.random() * 900 + 99);
    const date = new Date();
    const expiry = date.getMonth() + "/" + (date.getFullYear() + 1);

    do {
      card_no = Math.floor(Math.random() * 9000000000 + 999999999);
      cardMatch = await (await database())
        .collection("users")
        .findOne({ card_no });
    } while (cardMatch !== null);

    // Adding user
    const newUser: any = {
      ...req.body,

      account_no,
      card_no,
      cvv,
      expiry,

      password: await hash(password, 14),
    };

    await (await database()).collection("users").insertOne({ ...newUser });

    delete newUser.password;
    delete newUser.cvv;
    delete newUser.card_no;
    delete newUser.expiry;

    return { success: true, user: newUser };
  } catch (err) {
    next(new errorClass(res, err.message, 501));
    return { success: false };
  }
};

export const userLogin = async (
  email: string,
  password: string,
  next: NextFunction,
  res: Response,
) => {
  try {
    const databaseResponse = await (await database())
      .collection("users")
      .findOne({ email });

    if (databaseResponse === null) throw Error("User does not exist");
    if (!(await compare(password, databaseResponse.password)))
      throw Error("Invalid credentials");
    return await signJwt({ email });
  } catch (error) {
    next(new errorClass(res, error.message, 501));
    return;
  }
};

export const getUser = async (
  req: UserRequest,
  next: NextFunction,
  res: Response,
) => {
  try {
    const token = req.headers.authorization?.split(" ")[1];

    const { email } = await verifyJwt(token!);
    const user = await (await database())
      .collection("users")
      .findOne({ email });
    if (user) {
      delete user.password;
    }
    return user;
  } catch (error) {
    next(new errorClass(res, error.message, 501));
    return;
  }
};

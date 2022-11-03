import { compare, hash } from "bcrypt";
import { NextFunction } from "express";
import { signJwt } from "../../shared/services/jwtService";
import database from "../../loaders/database";
import errorClass from "../../shared/error";
import { Response } from "express";
import { KycRequest } from "./routes";

export const register = async (
  req: KycRequest,
  next: NextFunction,
  res: Response,
) => {
  try {
    const password = req.body.password;

    // Check for exisiting users
    const databaseResponse = await (await database())
      .collection("kyc-users")
      .findOne({ email: req.body.email });
    if (databaseResponse !== null)
      throw Error("Existing user with the same email");

    // Adding user
    const newUser: any = {
      ...req.body,
      password: await hash(password, 14),
    };

    await (await database()).collection("kyc-users").insertOne({ ...newUser });

    delete newUser.password;

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
      .collection("kyc-users")
      .findOne({ email });

    if (databaseResponse === null) throw Error("User does not exist");
    if (!(await compare(password, databaseResponse.password)))
      throw Error("Invalid credentials");
    return await signJwt({ email, role: "admin" });
  } catch (error) {
    next(new errorClass(res, error.message, 501));
    return;
  }
};

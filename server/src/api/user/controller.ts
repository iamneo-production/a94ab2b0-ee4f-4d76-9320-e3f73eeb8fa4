import { NextFunction, Response } from "express";
import database from "../../loaders/database";
import errorClass from "../../shared/error";
import { compare, hash } from "bcrypt";
import { signJwt } from "../../shared/services/jwtService";
import { UserRequest } from "./routes";

export const register = async (
  req: UserRequest,
  next: NextFunction,
  res: Response,
) => {
  try {
    const password = req.body.password;
    const databaseResponse = await (await database())
      .collection("users")
      .findOne({ username: req.body.username });
    if (databaseResponse !== null)
      throw Error("Existing user with the same username");
    const newUser: any = {
      ...req.body,
      password: await hash(password, 14),
    };

    await (await database()).collection("users").insertOne({ ...newUser });
    return true;
  } catch (err) {
    next(new errorClass(res, err.message, 501));
    return false;
  }
};

export const userLogin = async (
  username: string,
  password: string,
  next: NextFunction,
  res: Response,
) => {
  try {
    const databaseResponse = await (await database())
      .collection("users")
      .findOne({ username });

    if (databaseResponse === null) throw Error("User does not exist");
    if (!(await compare(password, databaseResponse.password)))
      throw Error("Invalid credentials");
    return await signJwt({ username, name: databaseResponse.name });
  } catch (error) {
    next(new errorClass(res, error.message, 501));
    return;
  }
};

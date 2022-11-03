import { compare, hash } from "bcrypt";
import { NextFunction } from "express";
import { signJwt, verifyJwt } from "../../shared/services/jwtService";
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
    const pin = req.body.pin;

    // Check for exisiting users
    const databaseResponse = await (await database())
      .collection("kyc-users")
      .findOne({ email: req.body.email });
    if (databaseResponse !== null)
      throw Error("Existing user with the same email");

    // Adding user
    const newUser: any = {
      ...req.body,
      pin: await hash(pin, 14),
    };

    await (await database()).collection("kyc-users").insertOne({ ...newUser });

    delete newUser.pin;

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

export const update = async (
  req: KycRequest,
  next: NextFunction,
  res: Response,
) => {
  try {
    const email = (await verifyJwt(req.headers.authorization?.split(" ")[1]!))
      .email;
    const oldData = await (await database())
      .collection("kyc-users")
      .findOne({ email });
    if (oldData == null) throw new Error("User does not exist");
    await (await database()).collection("kyc-users").updateOne(
      { email },
      {
        $set: {
          pan: req.body.pan || oldData!.pan,
          aadhar: req.body.aadhar || oldData!.aadhar,
          signature: req.body.signature || oldData!.signature,
        },
      },
    );
    return { success: true };
  } catch (error) {
    next(new errorClass(res, error.message, 501));
    return { success: false };
  }
};

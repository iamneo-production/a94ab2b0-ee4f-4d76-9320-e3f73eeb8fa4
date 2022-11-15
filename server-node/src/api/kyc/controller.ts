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

    const dpUser = await (await database())
      .collection("users")
      .findOne({ email: req.body.email });

    // Adding user
    const newUser: any = {
      ...req.body,
      dp_id: dpUser?._id,
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
  pin: string,
  next: NextFunction,
  res: Response,
) => {
  try {
    const databaseResponse = await (await database())
      .collection("kyc-users")
      .findOne({ email });

    if (databaseResponse === null) throw Error("User does not exist");
    if (!(await compare(pin, databaseResponse.pin)))
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
    console.log(
      oldData.dp_id,
      oldData.pan?.number,
      oldData.aadhar?.number,
      oldData.signature,
    );

    if (
      oldData.dp_id &&
      (oldData.pan?.number || req.body.pan) &&
      (oldData.aadhar?.number || req.body.aadhar) &&
      (oldData.signature?.image_url || req.body.signature)
    ) {
      await (await database())
        .collection("users")
        .findOneAndUpdate({ _id: oldData.dp_id }, { $set: { kyc: true } });
    }
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

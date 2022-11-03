import { NextFunction, Request, Response, Router } from "express";
import errorClass from "../../shared/error";
// import { authMiddleware } from "../../shared/middlewares/authMiddleware";
import { requestValidation } from "../../shared/middlewares/validationMiddleware";
import { register, userLogin } from "./controller";

import { bodySchema, loginSchema, registerSchema } from "./schema";
const app = Router();

export interface KycRequest extends Request {
  body: any;
}
export const KycRouteHandler = () => {
  app.post("/login", requestValidation("body", loginSchema), loginUserHandler);
  app.post(
    "/register",
    requestValidation("body", registerSchema),
    createKycUser,
  );

  return app;
};

const loginUserHandler = async (
  req: KycRequest,
  res: Response,
  next: NextFunction,
) => {
  try {
    const jwt = await userLogin(req.body.email, req.body.password, next, res);
    if (jwt) {
      res.json({
        success: true,
        key: jwt,
        message: "User Logged In Successfully",
      });
    }
  } catch (error) {
    next(new errorClass(res, error.message, 401));
  }
};

const createKycUser = async (
  req: KycRequest,
  res: Response,
  next: NextFunction,
) => {
  try {
    const response = await register(req, next, res);
    if (response.success == true)
      res.json({ ...response, message: "User was added successfully" });
  } catch (error) {
    next(new errorClass(res, error.message, 401));
  }
};

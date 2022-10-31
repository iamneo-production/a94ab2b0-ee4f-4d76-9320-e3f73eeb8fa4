import { NextFunction, Request, Response, Router } from "express";
import errorClass from "../../shared/error";
// import { authMiddleware } from "../../shared/middlewares/authMiddleware";
import { requestValidation } from "../../shared/middlewares/validationMiddleware";
import { register, userLogin } from "./controller";
import { createUserSchema, loginUserSchema } from "./schema";
const app = Router();

export interface UserRequest extends Request {
  body: any;
}

export const UserRouteHandler = () => {
  app.post(
    "/register",
    requestValidation("body", createUserSchema),
    createUserHandler,
  );

  app.post(
    "/login",
    requestValidation("body", loginUserSchema),
    loginUserHandler,
  );

  return app;
};

const createUserHandler = async (
  req: UserRequest,
  res: Response,
  next: NextFunction,
) => {
  try {
    const success = await register(req, next, res);
    if (success == true)
      res.json({ success: true, message: "User was added successfully" });
  } catch (error) {
    next(new errorClass(res, error.message, 401));
  }
};

const loginUserHandler = async (
  req: UserRequest,
  res: Response,
  next: NextFunction,
) => {
  try {
    const jwt = await userLogin(
      req.body.username,
      req.body.password,
      next,
      res,
    );
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

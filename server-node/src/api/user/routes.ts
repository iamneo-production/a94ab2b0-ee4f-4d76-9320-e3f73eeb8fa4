import { NextFunction, Request, Response, Router } from "express";
import { authMiddleware } from "../../shared/middlewares/authMiddleware";
import errorClass from "../../shared/error";
// import { authMiddleware } from "../../shared/middlewares/authMiddleware";
import { requestValidation } from "../../shared/middlewares/validationMiddleware";
import { getUser, register, userLogin } from "./controller";
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

  app.get("/get-details", authMiddleware, getUserHandler);

  return app;
};

const createUserHandler = async (
  req: UserRequest,
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

const loginUserHandler = async (
  req: UserRequest,
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

const getUserHandler = async (
  req: UserRequest,
  res: Response,
  next: NextFunction,
) => {
  try {
    const user = await getUser(req, next, res);
    if (user) {
      res.json({
        success: true,
        user,
      });
    }
  } catch (error) {
    next(new errorClass(res, error.message, 401));
  }
};

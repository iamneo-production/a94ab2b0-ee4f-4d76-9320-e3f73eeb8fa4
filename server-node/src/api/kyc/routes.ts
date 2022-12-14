import { NextFunction, Request, Response, Router } from "express";
import { authMiddleware } from "../../shared/middlewares/authMiddleware";
import errorClass from "../../shared/error";
// import { authMiddleware } from "../../shared/middlewares/authMiddleware";
import { requestValidation } from "../../shared/middlewares/validationMiddleware";
import { register, update, userLogin } from "./controller";

import { bodySchema, loginSchema, registerSchema } from "./schema";
import { upload } from "../../shared/middlewares/multerMiddleware";
const app = Router();

export interface KycRequest extends Request {
  body: any;
  file?: any;
}
export const KycRouteHandler = () => {
  app.post("/login", requestValidation("body", loginSchema), loginUserHandler);
  app.post(
    "/register",
    requestValidation("body", registerSchema),
    createKycUser,
  );
  app.put(
    "/update",
    authMiddleware,
    requestValidation("body", bodySchema),
    detailHandler,
  );

  app.post("/upload", authMiddleware, upload.single("template"), uploadHandler);

  return app;
};

const loginUserHandler = async (
  req: KycRequest,
  res: Response,
  next: NextFunction,
) => {
  try {
    const jwt = await userLogin(req.body.email, req.body.pin, next, res);
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

const detailHandler = async (
  req: KycRequest,
  res: Response,
  next: NextFunction,
) => {
  try {
    const response = await update(req, next, res);
    if (response.success == true)
      res.json({
        ...response,
        message: "User details were updated successfully",
      });
  } catch (error) {
    next(new errorClass(res, error.message, 401));
  }
};

const uploadHandler = async (
  req: KycRequest,
  res: Response,
  next: NextFunction,
) => {
  try {
    console.log(req.file.location);

    let url = req.file?.location;
    url = url?.split("/");
    url[2] = url[2]?.split(".")?.slice(1)?.join(".");
    url = url?.join("/");

    res.json({ success: true, data: url });
  } catch (error) {
    next(new errorClass(res, error.message, 401));
  }
};

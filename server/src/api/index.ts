import { Router } from "express";
import { UserRouteHandler } from "./user/routes";

export default (): Router => {
  const app = Router();
  app.use("/user", UserRouteHandler());

  return app;
};

"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.UserRouteHandler = void 0;
const express_1 = require("express");
const error_1 = __importDefault(require("../../shared/error"));
const validationMiddleware_1 = require("../../shared/middlewares/validationMiddleware");
const controller_1 = require("./controller");
const schema_1 = require("./schema");
const app = (0, express_1.Router)();
const UserRouteHandler = () => {
    app.post("/register", (0, validationMiddleware_1.requestValidation)("body", schema_1.createUserSchema), createUserHandler);
    app.post("/login", (0, validationMiddleware_1.requestValidation)("body", schema_1.loginUserSchema), loginUserHandler);
    return app;
};
exports.UserRouteHandler = UserRouteHandler;
const createUserHandler = (req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const success = yield (0, controller_1.register)(req, next, res);
        if (success == true)
            res.json({ success: true, message: "User was added successfully" });
    }
    catch (error) {
        next(new error_1.default(res, error.message, 401));
    }
});
const loginUserHandler = (req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const jwt = yield (0, controller_1.userLogin)(req.body.username, req.body.password, next, res);
        if (jwt) {
            res.json({
                success: true,
                key: jwt,
                message: "User Logged In Successfully",
            });
        }
    }
    catch (error) {
        next(new error_1.default(res, error.message, 401));
    }
});
//# sourceMappingURL=routes.js.map
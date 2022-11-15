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
exports.userLogin = exports.register = void 0;
const database_1 = __importDefault(require("../../loaders/database"));
const error_1 = __importDefault(require("../../shared/error"));
const bcrypt_1 = require("bcrypt");
const jwtService_1 = require("../../shared/services/jwtService");
const register = (req, next, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const password = req.body.password;
        const databaseResponse = yield (yield (0, database_1.default)())
            .collection("users")
            .findOne({ username: req.body.username });
        if (databaseResponse !== null)
            throw Error("Existing user with the same username");
        const newUser = Object.assign(Object.assign({}, req.body), { password: yield (0, bcrypt_1.hash)(password, 14) });
        yield (yield (0, database_1.default)()).collection("users").insertOne(Object.assign({}, newUser));
        return true;
    }
    catch (err) {
        next(new error_1.default(res, err.message, 501));
        return false;
    }
});
exports.register = register;
const userLogin = (username, password, next, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const databaseResponse = yield (yield (0, database_1.default)())
            .collection("users")
            .findOne({ username });
        if (databaseResponse === null)
            throw Error("User does not exist");
        if (!(yield (0, bcrypt_1.compare)(password, databaseResponse.password)))
            throw Error("Invalid credentials");
        return yield (0, jwtService_1.signJwt)({ username, name: databaseResponse.name });
    }
    catch (error) {
        next(new error_1.default(res, error.message, 501));
        return;
    }
});
exports.userLogin = userLogin;
//# sourceMappingURL=controller.js.map
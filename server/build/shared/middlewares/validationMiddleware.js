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
exports.requestValidation = void 0;
const error_1 = __importDefault(require("../error"));
function requestValidation(location, schema) {
    return (req, res, next) => __awaiter(this, void 0, void 0, function* () {
        let _location;
        switch (location) {
            case "query":
                _location = req.query;
                break;
            case "body":
                _location = req.body;
        }
        try {
            yield schema.validate(_location);
            next();
        }
        catch (err) {
            next(new error_1.default(res, err.message, 500));
        }
    });
}
exports.requestValidation = requestValidation;
//# sourceMappingURL=validationMiddleware.js.map
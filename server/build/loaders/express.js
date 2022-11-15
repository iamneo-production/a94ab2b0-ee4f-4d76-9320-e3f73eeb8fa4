"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const cors_1 = __importDefault(require("cors"));
const config_1 = __importDefault(require("../config"));
const express_1 = __importDefault(require("express"));
const helmet_1 = __importDefault(require("helmet"));
const api_1 = __importDefault(require("../api"));
exports.default = ({ app }) => {
    app.get("/healthcheck", (_req, res) => {
        const healthcheck = {
            uptime: process.uptime(),
            message: "OK",
            timestamp: Date.now(),
        };
        try {
            return res.json(healthcheck);
        }
        catch (e) {
            return res.status(503).send();
        }
    });
    app.enable("trust proxy");
    app.use((0, helmet_1.default)());
    app.use((0, cors_1.default)());
    app.use(express_1.default.json());
    app.use(config_1.default.api.prefix, (0, api_1.default)());
};
//# sourceMappingURL=express.js.map
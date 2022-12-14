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
const express_1 = __importDefault(require("express"));
const config_1 = __importDefault(require("./config"));
const loaders_1 = __importDefault(require("./loaders"));
function startServer() {
    return __awaiter(this, void 0, void 0, function* () {
        const app = (0, express_1.default)();
        yield (0, loaders_1.default)({ expressApp: app });
        app.get("/", (_req, res) => res.send("hello"));
        app
            .listen(config_1.default.port, () => {
            console.log(`
      #####################################################
      🛡️  Server listening on port: http://localhost:${config_1.default.port} 🛡️
      #####################################################
    `);
        })
            .on("error", (err) => {
            console.error(err);
            process.exit(1);
        });
    });
}
startServer();
//# sourceMappingURL=index.js.map
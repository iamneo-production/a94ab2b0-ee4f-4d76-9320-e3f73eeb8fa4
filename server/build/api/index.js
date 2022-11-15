"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const routes_1 = require("./user/routes");
exports.default = () => {
    const app = (0, express_1.Router)();
    app.use("/user", (0, routes_1.UserRouteHandler)());
    return app;
};
//# sourceMappingURL=index.js.map
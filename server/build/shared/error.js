"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
class errorClass extends Error {
    constructor(res, message, statusCode) {
        super(message);
        this.statusCode = statusCode;
        res.json({ success: false, message });
    }
}
exports.default = errorClass;
//# sourceMappingURL=error.js.map
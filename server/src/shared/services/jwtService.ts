import { sign, verify } from "jsonwebtoken";

export const signJwt = async (payload: any, options?: any) => {
  options = options !== undefined ? options : {};
  return sign(payload, process.env.JWT_SECRET!, options);
};

export const verifyJwt = async (token: string): Promise<any> => {
  return verify(token, process.env.JWT_SECRET!);
};

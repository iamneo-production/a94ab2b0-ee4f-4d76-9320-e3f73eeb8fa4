import axios from "axios";
import { setCookie } from "nookies";

export const instance = axios.create({
  baseURL: process.env.NEXT_PUBLIC_BASE_URL,
  headers: {
    "Content-Type": "application/json",
    "Access-Control-Allow-Origin": "*",
  },
});

export const signup = async (payload: any) => {
  try {
    delete payload.confirmPassword;
    const res = await instance.post("/kyc/register", payload);

    if (!res.data.success) {
      handleError(res.data.message);
      return;
    }
    login({ email: payload.email, pin: payload.pin });
    return res.data;
  } catch (err: any) {
    console.log(err);
    handleError(err.error);
  }
};

export const login = async (payload: any) => {
  try {
    const res = await instance.post("/kyc/login", payload);

    if (!res.data.success) {
      handleError(res.data.message);
      return;
    }
    setCookie(null, "accessToken", res.data.key);
    return res.data;
  } catch (err: any) {
    console.log(err);
    handleError(err.error);
  }
};

export const update = async (payload: any, token: string) => {
  try {
    const res = await instance.put("/kyc/update", payload, {
      headers: {
        authorization: `Bearer ${token}`,
      },
    });

    if (!res.data.success) {
      handleError(res.data.message);
      return;
    }
    setCookie(null, "accessToken", res.data.key);
    return res.data;
  } catch (err: any) {
    console.log(err);
    handleError(err.error);
  }
};

function handleError(message: any) {
  //handle error
}

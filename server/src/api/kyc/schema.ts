import * as yup from "yup";

const kycLogin = {
  email: yup.string().email().required(),
  password: yup.string().required(),
};

const kycRegister = {
  ...kycLogin,
  phone: yup.string().length(10).required(),
  name: yup.string().required(),
};

const kycSchema = {
  uid: yup.string().length(10),
  pan: yup.object(),
  aadhar: yup.object(),
  signature: yup.mixed(),
};

export const loginSchema = new yup.ObjectSchema(kycLogin);
export const registerSchema = new yup.ObjectSchema(kycRegister);
export const bodySchema = new yup.ObjectSchema(kycSchema);

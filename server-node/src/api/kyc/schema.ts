import * as yup from "yup";

const kycLogin = {
  email: yup.string().email().required(),
  pin: yup.string().required(),
};

const kycRegister = {
  ...kycLogin,
  phone: yup.string().length(10).required(),
  name: yup.string().required(),
};

const documentSchema = {
  number: yup.string(),
  image_url: yup.string().url(),
};

const kycSchema = {
  uid: yup.string().length(10),
  pan: yup.object().shape(documentSchema),
  aadhar: yup.object().shape(documentSchema),
  signature: yup.object().shape(documentSchema),
};

export const loginSchema = new yup.ObjectSchema(kycLogin);
export const registerSchema = new yup.ObjectSchema(kycRegister);
export const bodySchema = new yup.ObjectSchema(kycSchema);

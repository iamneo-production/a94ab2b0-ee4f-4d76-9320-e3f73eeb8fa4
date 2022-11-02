import * as yup from "yup";

const userLogin = {
  email: yup.string().email().trim(),
  password: yup.string().required().trim(),
};

const userSchema = {
  ...userLogin,

  account_no: yup.string().length(10).trim(),
  pin: yup.string().length(6).required().trim(),
  phone: yup.string().length(10).required().trim(),
  name: yup.string().required().trim(),

  bank_name: yup.string().default("dot-pay").required().trim(),
  kyc: yup.bool().default(false),
};

export const loginUserSchema = new yup.ObjectSchema(userLogin);
export const createUserSchema = new yup.ObjectSchema(userSchema);
export const updateUserSchema = new yup.ObjectSchema({
  ...userSchema,
  id: yup.string().required().trim(),
});
export const deleteUserSchema = new yup.ObjectSchema({
  id: yup.string().required().trim(),
});

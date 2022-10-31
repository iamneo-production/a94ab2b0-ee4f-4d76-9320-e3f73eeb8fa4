import * as yup from "yup";

const userLogin = {
  email: yup.string().email().trim(),
  password: yup.string().required().trim(),
};

const userSchema = {
  ...userLogin,
  name: yup.string().required().trim(),
  phone: yup.string().length(10),
  account_no: yup.string().length(10),
  pin: yup.string().length(4),
  cvv: yup.string().length(3),
  expiry: yup.string().length(5),
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

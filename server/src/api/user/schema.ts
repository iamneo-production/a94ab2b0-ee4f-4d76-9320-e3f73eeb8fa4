import * as yup from "yup";

const userLogin = {
  username: yup.string().required().trim(),
  password: yup.string().required().trim(),
};

const userSchema = {
  ...userLogin,
  name: yup.string().required().trim(),
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

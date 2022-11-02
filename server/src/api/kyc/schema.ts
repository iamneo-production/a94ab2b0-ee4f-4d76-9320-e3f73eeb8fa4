import * as yup from "yup";

const kycSchema = {
  uid: yup.string().length(10),
  name: yup.string(),
  email: yup.string().email(),
  phone: yup.string().length(10),
  pan: yup.object(),
  aadhar: yup.object(),
  signature: yup.mixed(),
};

export const adminSchema = new yup.ObjectSchema(kycSchema);

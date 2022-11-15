import { instance } from "./api";

export const upload = async (
  payload: string,
  accessToken: string,
): Promise<any> => {
  try {
    const formData = new FormData();
    const imagefile = payload;
    formData.append("template", imagefile);
    const res = await instance.post("/kyc/upload", formData, {
      headers: {
        "content-type": "multipart/form-data",
        "authorization": `Bearer ${accessToken}`,
      },
    });
    if (!res.data.success) {
      handleError(res.data.message);
    }
    return res.data;
  } catch (err) {
    handleError("Oops! Something went wrong.", err);
    return false;
  }
};

const handleError = (msg: string, err?: any) => {
  //   toast.error(msg);
  console.log({ err });
};

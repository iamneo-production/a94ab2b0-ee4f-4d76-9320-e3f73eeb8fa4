import multer from "multer";
import multerS3 from "multer-s3";
import { S3Client } from "@aws-sdk/client-s3";
const s3 = new S3Client({
  region: "ap-south-1",
});

const storage = multerS3({
  s3,
  bucket: process.env.AWS_BUCKET!,
  contentType: multerS3.AUTO_CONTENT_TYPE,
  metadata: function (_req, file, cb) {
    console.log("metadata");
    cb(null, { fieldName: file.fieldname });
  },

  key: function (_req, file, cb) {
    console.log("key");

    cb(null, new Date().toISOString() + file.originalname);
  },
});

export const upload = multer({ storage });

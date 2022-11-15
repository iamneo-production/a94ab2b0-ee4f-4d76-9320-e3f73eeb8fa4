import { Field, Form, Formik } from "formik";
import { useRouter } from "next/router";
import { parseCookies } from "nookies";
import { useEffect, useState } from "react";
import * as yup from "yup";
import { signup, update } from "../utils/api";
import { upload } from "../utils/uploadFile";

const Signup = () => {
  const [step, setStep] = useState(0);
  const [template, setTemplate] = useState();
  let imgUrl: string;
  const initialValues = {
    phone: "",
    name: "",
    age: "",
    email: "",
    pin: "",
    number: "",
  };

  const validationSchema = yup.object({
    phone: yup.number().integer().min(1000000000).max(9999999999).required(),
    name: yup.string().required(),
    age: yup.number().required(),
    email: yup.string().email().required(),
    pin: yup.string().length(6).required(),
  });

  useEffect(() => {
    (async () => {
      if (template) {
        const res = await upload(template, parseCookies().accessToken);
        imgUrl = await res.data?.data;
        setTemplate(undefined);
      }
    })();
  }, [template]);

  return (
    <Formik
      initialValues={initialValues}
      validationSchema={step == 0 && validationSchema}
      onSubmit={async (values) => {
        console.log(values, step);

        const { phone, name, age, email, pin } = values;
        if (step == 0) {
          const res = await signup({ phone, name, age, email, pin });
          if (res.success) setStep(1);
        }
        console.log("here", imgUrl);
        if (step == 1 && imgUrl) {
          const res = await update(
            {
              adhaar: {
                url: imgUrl,
                number: 123456,
              },
            },
            parseCookies().accessToken,
          );
          if (res) setStep(step + 1);
        }

        if (step == 2 && imgUrl) {
          const res = await update(
            {
              pan: {
                url: imgUrl,
                number: 123456,
              },
            },
            parseCookies().accessToken,
          );
          if (res) setStep(step + 1);
        }

        if (step == 3 && imgUrl) {
          const res = await update(
            {
              signature: {
                url: imgUrl,
              },
            },
            parseCookies().accessToken,
          );
          if (res) useRouter().push("/success");
        }
      }}
    >
      {({ values, errors, touched }) => (
        <Form className="flex flex-col gap-4 max-w-sm items-center justify-center mx-auto">
          {step == 0 && (
            <>
              <Field type="text" name="phone" placeholder="phone" />
              <Field type="text" name="name" placeholder="name" />
              <Field type="number" name="age" placeholder="age" />
              <Field type="email" name="email" placeholder="Email" />
              <Field type="text" name="pin" placeholder="pin" />
            </>
          )}

          {step >= 1 && (
            <>
              <input
                type="file"
                name="template"
                onChange={(e: any) =>
                  e.target?.files?.length > 0 && setTemplate(e.target.files[0])
                }
                className="textInput inputfile"
              />
              <label>Choose a file</label>

              <Field type="text" name="phone" placeholder="number" />
            </>
          )}
          <button type="submit">Submit</button>
          <button onClick={() => setStep(1)}>Next</button>
          <pre>{JSON.stringify(errors, null, 2)}</pre>
        </Form>
      )}
    </Formik>
  );
};

export default Signup;

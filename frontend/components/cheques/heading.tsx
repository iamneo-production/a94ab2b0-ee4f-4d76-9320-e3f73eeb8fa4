import React, { FC } from "react";
interface Text {
  text: string;
}
const Heading: FC<Text> = (prop): JSX.Element => {
  return (
    <>
      <h1>{prop.text}</h1>
      <hr />
    </>
  );
};

export default Heading;

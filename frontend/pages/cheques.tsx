import React, { FC, useState } from "react";
import Heading from "../components/cheques/heading";
import UploadCheque from "../components/cheques/uploadCheque";

const Cheques: FC = () => {
  const [cheques, setCheques] = useState();

  return (
    <div className="ml-[15%] py-[3%]">
      <Heading text="Cheques" />
      <UploadCheque />
    </div>
  );
};

export default Cheques;

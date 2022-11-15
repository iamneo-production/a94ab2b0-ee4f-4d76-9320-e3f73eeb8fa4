import React, { FC } from "react";
import logo from "../../public/dotpayLogo.png";
import signal from "../../public/dashboard/signal.png";
import chip from "../../public/dashboard/chip.png";
import Image from "next/image";

const Card: FC = () => {
  return (
    <div className="w-[22vw] flex flex-col justify-between py-4 px-4  h-[25vh] rounded-[8px] bg-[#303088]">
      <div className="flex flex-row items-center justify-between">
        <div className="w-[20%] ">
          <Image alt="logo" src={logo} layout="responsive" />
        </div>

        <div className="w-[6%] ">
          <Image alt="logo" src={signal} layout="responsive" />
        </div>
      </div>
      <div className="flex text-white flex-row items-center justify-between">
        <p className=" ">Card Holder</p>

        <div className="w-[10%] ">
          <Image alt="logo" src={chip} layout="responsive" />
        </div>
      </div>
    </div>
  );
};

export default Card;

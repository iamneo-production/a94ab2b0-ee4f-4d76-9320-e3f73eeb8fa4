import Image from "next/image";
import { useState } from "react";
import Link from "next/link";
import React, { FC } from "react";
import logo from "../../../public/dotpayLogo.png";

const SideBar: FC = () => {
  const [isOpen, setIsOpen] = useState(false);

  const link = [
    ["Dashboard", "/dashboard", "/navbar/dashboard.png"],
    ["Transter Amount", "transfer", "/navbar/transaction.png"],
    ["Cheques", "/cheques", "/navbar/cheques.png"],
    ["Investments", "/investments", "/navbar/investment.png"],
    ["Dotcoin", "/dotcoin", "/navbar/coin.gif"],
    ["Rewards", "/rewards", "/navbar/Group 5.png"],
  ];

  return (
    <div className="lg:w-[17%] hidden lg:block md:block    lg:h-screen lg:fixed lg:bg-gradient-to-b lg:from-[#303A91] lg:to-[#48207A] md:w-[17%]     md:h-screen md:fixed md:bg-gradient-to-b from-[#303A91] to-[#48207A]">
      <div className=" mx-[10%] my-6 max-w-[40%]">
        <Link href="/dashboard">
          <Image src={logo} alt="" layout="responsive" />
        </Link>
      </div>
      {link.map(([title, url, icon]) => {
        return (
          <div className=" h-12 flex items-center w-full hover:bg-[#3C5287]">
            <Link
              className="flex flex-row flex-auto mx-[10%] gap-[10%]"
              href={url}
            >
              <img className="  w-6 h-auto" alt={title} src={icon} />
              <p className="  w-full text-white font-medium">{title}</p>
            </Link>
          </div>
        );
      })}
    </div>
  );
};

export default SideBar;

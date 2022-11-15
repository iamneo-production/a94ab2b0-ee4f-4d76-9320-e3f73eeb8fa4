import Image from "next/image";
import landingSvg from "../public/landing.svg";
import Signup from "./signup";

const Landing = () => {
  return (
    <div className="grid grid-cols-1 md:grid-cols-2 items-center justify-center w-screen min-h-screen">
      <Image
        src={landingSvg}
        width={632}
        height={397}
        alt="landing image"
        className="row-start-2 md:row-start-1 "
      />
      <div className="bg-accent w-full h-full row-start-1 md:row-start-1 flex flex-col items-center justify-center gap-8 ">
        <h3>Create Account</h3>
        <h5>Open your account in few steps</h5>
        <Signup />
      </div>
    </div>
  );
};

export default Landing;

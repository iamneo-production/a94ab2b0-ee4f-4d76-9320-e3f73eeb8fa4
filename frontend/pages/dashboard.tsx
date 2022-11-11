import React, { FC } from "react";
import Card from "../components/dashboard/card";
import Labels from "../components/dashboard/labels";
export const labelContext = React.createContext("label");
const Dashboard: FC = () => {
  return (
    <div className="ml-[15%]">
      <h1 className="mx-[2%] py-8">Welcome,</h1>
      <div className="flex flex-row">
        <Card />
        <labelContext.Provider value="label">
          <Labels />
        </labelContext.Provider>
      </div>
    </div>
  );
};

export default Dashboard;

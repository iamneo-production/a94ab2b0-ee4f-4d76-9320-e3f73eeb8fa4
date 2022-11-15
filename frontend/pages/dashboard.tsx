import React, { FC, useEffect, useState } from "react";
import Card from "../components/dashboard/card";
import axios from "axios";
import Labels from "../components/dashboard/labels";
import AddLabel from "../components/dashboard/addLabel";
// import Labels from "../components/dashboard/labels";

export const labelContext = React.createContext("label");
const Dashboard: FC = () => {
  const [labelData, setLabelData] = useState([]);
  const [labelName, setLabelName] = useState("");
  const acctn = 4567889039;
  const baseURL = `https://tokenbalance-production.up.railway.app/api/labels/${acctn}`;
  useEffect(() => {
    const fetchData = async () => {
      const result = await axios.get(baseURL);

      setLabelData(result.data.labelData);
      console.log(result.data.labelData);
    };
    fetchData();
    return () => {
      console.log("unmounted");
    };
  }, []);

  const labelHandler = (data: string) => {
    setLabelName(data);
  };

  return (
    <div className="ml-[15%]">
      <h1 className=" mx-[2%] py-8">Welcome,</h1>
      <div className="flex mx-[2%] gap-[2%] flex-row h-full ">
        <Card />
        <Labels text={labelData} labelName={labelName} />
      </div>

      <div className=" mx-[2%] my-[4%] flex flex-row gap-4">
        {labelData.map((data) => {
          return (
            <button
              onClick={setLabelName.bind(null, data.label_name)}
              className=" rounded-lg border-2 border-blue-700 min-w-[10%] border"
              key={data}
            >
              {data?.label_name}
            </button>
          );
        })}
        <span className="w-0.5 h-10 bg-gray-300 "></span>
        <AddLabel />
      </div>
    </div>
  );
};

export default Dashboard;

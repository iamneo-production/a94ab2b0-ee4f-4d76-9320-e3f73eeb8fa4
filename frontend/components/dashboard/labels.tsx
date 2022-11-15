import React, { FC, useEffect, useState, useContext } from "react";
import axios from "axios";

interface Text {
  text: Array<string>;
  labelName: string;
}
const Labels: FC<Text> = (props): JSX.Element => {
  const [cardData, setCardData] = useState([]);
  const baseURL =
    "https://tokenbalance-production.up.railway.app/api/labels/12345";
  useEffect(() => {
    const fetchData = async () => {
      const result = await axios.get(baseURL);
      setCardData(result.data);
      console.log(result.data);
    };
    fetchData();

    return () => {
      console.log("unmounted");
    };
  }, []);

  return (
    <div className="h-[100%]">
      <div className="h-[100%]">
        {props.text.map((data) => {
          {
            return (
              <div className=" h-[100%] " key={data}>
                {props.labelName === data.label_name ? (
                  <div className="flex flex-col gap-8 justify-between h-full ">
                    <div>
                      {" "}
                      <span className="px-4  w-[40%]  bg-[#DFDFDF] rounded text-gray-700 ">
                        {data.label_type.charAt(0).toUpperCase() +
                          data.label_type.slice(1)}
                      </span>
                      <p className=" font-sans text-xl font-medium text-gray-800 ">
                        {data.label_name}
                      </p>
                    </div>

                    <div>
                      {" "}
                      <p className=" font-sans text-sm font-medium text-gray-600 ">
                        {data.label_description}
                      </p>
                      <p className=" font-sans text-xl font-medium text-gray-800 ">
                        Amount: ₹{data.currentAmt}
                      </p>
                      <div
                        className="relative bg-[#F2F2F2] h-3 rounded-full "
                        style={{
                          width:
                            (data.labelAmt / data.labelAmt).toPrecision(2) *
                            300,
                        }}
                      >
                        <div
                          className="absolute bg-gradient-to-r from-[#387AA9] to-[#278F82] h-3 rounded-full "
                          style={{
                            width:
                              (data.currentAmt / data.labelAmt).toPrecision(2) *
                              300,
                          }}
                        ></div>
                      </div>
                      <p className=" font-sans text-sm font-medium text-gray-600 ">
                        Set Limit : ₹{data.labelAmt}
                      </p>
                    </div>
                  </div>
                ) : (
                  ""
                )}
              </div>
            );
          }
        })}
      </div>
    </div>
  );
};

export default Labels;

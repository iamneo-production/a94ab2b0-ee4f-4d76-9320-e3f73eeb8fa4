import React, { FC, useEffect, useState, useContext } from "react";
import axios from "axios";

import { labelContext } from "../../pages/dashboard";

const Labels: FC = () => {
  const [cardData, setCardData] = useState<any[]>([]);
  const baseURL =
    "https://tokenbalance-production.up.railway.app/api/labels/12345";
  useEffect(() => {
    const fetchData = async () => {
      const result = await axios.get(baseURL);
      setCardData(result.data);
      console.log(result.data);
    };
    fetchData();
  }, []);
  const value = useContext(labelContext);

  return (
    <div>
      {cardData.map((items) => {
        return (
          <div key={items?._id}>
            <span className="px-2 py-1 bg-gray-200 text-gray-900 rounded ">
              {items.label_type}
              {value}
            </span>
          </div>
        );
      })}
    </div>
  );
};

export default Labels;

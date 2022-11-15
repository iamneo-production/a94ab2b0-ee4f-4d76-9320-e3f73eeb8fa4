import React, { useState, useEffect } from "react";
import { useConnect } from "wagmi";
import { useAccount, useDisconnect, useEnsAvatar, useEnsName } from "wagmi";
import coin from "../public/navbar/coin.gif";
import axios from "axios";
const DotCoin = () => {
  const [account, setAccount] = useState();
  const [balance, setBalance] = useState([]);

  const { address, connector, isConnected } = useAccount();
  // const { data: ensAvatar } = useEnsAvatar({ address });
  const { data: ensName } = useEnsName({ address });
  const { connect, connectors, error, isLoading, pendingConnector } =
    useConnect();
  const { disconnect } = useDisconnect();

  // _acctn,
  //     polygon_acct,
  //     tokenBalance,
  //     redeemToken,

  const baseURL = "https://tokenbalance-production.up.railway.app/api/token/";

  const addToken = async () => {
    const response = await axios.post(baseURL, {
      _acctn: "4567889039",
      polygon_acct: address,
    });
    console.log(response);
  };

  const balanceURL =
    "https://tokenbalance-production.up.railway.app/api/getBalance/4567889039";

  useEffect(() => {
    const fetchBalance = async () => {
      const response = await axios.get(balanceURL);
      setBalance(response.data);
      console.log(response.data);
    };
    fetchBalance();
  }, []);

  if (isConnected) {
    return (
      <>
        {" "}
        <div className="ml-[2%] mml:w-[20%] lg:ml-[20%] py-10 text-3xl ">
          <h1 className="text-3xl ">DotCoin</h1>
          <hr className="h-[5px] bg-gradient-to-r from-[#387AA9] to-[#278F82] rounded w-[30%]" />
        </div>
        <div className="w-100vw gap-4 flex flex-col items-center justify-center">
          <img src="/navbar/coin.gif" alt="ENS Avatar" />
          <div>
            <span className="text-xl font-semibold text-gray-700 ">
              $DOT {balance?.dotBalance}
            </span>
          </div>

          <div className=" p-2 bg-gray-200 rounded-lg">
            {ensName ? `${ensName} (${address?.slice(4)})` : address}
          </div>
          {balance?.dotBalance > 0 ? (
            <p className="bg-green-400 text-white px-2 rounded-full ">
              account linked to bank
            </p>
          ) : (
            <button
              onClick={addToken}
              className="bg-[#387AA9] text-white rounded-lg p-2 mt-4"
            >
              Add Token
            </button>
          )}
        </div>
      </>
    );
  }

  return (
    <>
      <h1 className="ml-[2%] mml:w-[20%] lg:ml-[20%]">DotCoin</h1>
      <div className="ml-[20vw]">
        {connectors.map((connector) => (
          <button
            disabled={!connector.ready}
            key={connector.id}
            onClick={() => connect({ connector })}
          >
            {connector.name}
            {!connector.ready && " (unsupported)"}
            {isLoading &&
              connector.id === pendingConnector?.id &&
              " (connecting)"}
          </button>
        ))}

        {error && <div>{error.message}</div>}
      </div>
    </>
  );
};

export default DotCoin;

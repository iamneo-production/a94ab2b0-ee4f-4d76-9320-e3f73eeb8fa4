const Web3 = require("web3");
const axios = require("axios");
require("dotenv").config();
const Web3js = new Web3(
  new Web3.providers.HttpProvider(
    "https://polygon-mumbai.g.alchemy.com/v2/k9-fzzmRufr8jfx21LxcFI77JGbfRc4m"
  )
);

const privateKey = process.env.PIRVATE_KEY;

let tokenAddress = process.env.TOKEN_ADDRESS;

let toAddress = "0x8E7A5aF22aB3B208e2E2DD9cc2E0a26869c1dd17";

let fromAddress = "0xb1e2c87C4f58bB9d06189734843D8D20B5C2fBeD";
let amountToBe = "0.01";

let contractABI = [
  // transfer

  {
    constant: false,

    inputs: [
      {
        name: "_to",

        type: "address",
      },

      {
        name: "_value",

        type: "uint256",
      },
    ],

    name: "transfer",

    outputs: [
      {
        name: "",

        type: "bool",
      },
    ],

    type: "function",
  },
];

let contract = new Web3js.eth.Contract(contractABI, tokenAddress, {
  from: fromAddress,
});

let amount = Web3js.utils.toHex(Web3js.utils.toWei(amountToBe));

let data = contract.methods.transfer(toAddress, amount).encodeABI();

function sendErcToken() {
  let txObj = {
    gas: Web3js.utils.toHex(100000),

    to: tokenAddress,

    value: "0x00",

    data: data,

    from: fromAddress,
  };

  Web3js.eth.accounts.signTransaction(txObj, privateKey, (err, signedTx) => {
    if (err) {
      return callback(err);
    } else {
      console.log(signedTx);

      return Web3js.eth.sendSignedTransaction(
        signedTx.rawTransaction,
        (err, res) => {
          if (err) {
            console.log(err);
          } else {
            console.log(res);
            console.log("hi");
          }
        }
      );
    }
  });
}

//axios
// const finalTransaction = (req, res) => {
//   const { id } = req.params;
//   const axiosSend = async () => {
//     const promise = await axios
//       .get(`http://localhost:5000/api/token/${id}`)
//       .then((resData) => {
//         const data = resData.data;
//         return data;
//       });
//     return promise;
//   };
//   axiosSend().then((dataAcc) => {
//     console.log(dataAcc);
//   });
// };
// finalTransaction();
// module.exports = finalTransaction;

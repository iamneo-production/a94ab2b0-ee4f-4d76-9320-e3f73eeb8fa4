const axios = require("axios");

const apiKey = "k9-fzzmRufr8jfx21LxcFI77JGbfRc4m";

const baseURL = `https://polygon-mumbai.g.alchemy.com/v2/${apiKey}`;

const tokenAddr = "0x461089f45eDD7dAB76614651711b021439ca3835";

//

// var data = JSON.stringify({
//   jsonrpc: "2.0",
//   method: "alchemy_getTokenBalances",
//   params: [`${owner}`, [`${tokenAddr}`]],
//   id: 42,
// });

//
const axiosData = (req, res) => {
  const { id } = req.params;
  const axiosTest = async () => {
    const promise = await axios
      .get(`http://localhost:5000/api/token/${id}`)
      .then((res) => {
        const data = res.data;
        return data;
      });
    return promise;
  };
  axiosTest().then((dataAcc) => {
    const polygonAcc = dataAcc[0].polygon_acct;
    console.log(dataAcc);
    //
    var dataVal = JSON.stringify({
      jsonrpc: "2.0",
      method: "alchemy_getTokenBalances",
      params: [`${polygonAcc}`, [`${tokenAddr}`]],
      id: 42,
    });
    //
    var config = {
      method: "post",
      url: baseURL,
      headers: {
        "Content-Type": "application/json",
      },
      data: dataVal,
    };
    //
    const tokenData = async () => {
      const prom = await axios(config).then(function (response) {
        response.data["result"]["tokenBalances"][0]["tokenBalance"] = parseInt(
          response.data["result"]["tokenBalances"][0]["tokenBalance"],
          16
        );
        const balanceData =
          response.data.result.tokenBalances[0].tokenBalance / 10 ** 18;
        console.log(JSON.stringify(balanceData, null, 2));
        return balanceData;
      });
      return prom;
    };
    tokenData().then((dataFinal) => {
      res.json({ polygonAcc: polygonAcc, dotBalance: dataFinal });
    });
    //
  });
};

module.exports = axiosData;

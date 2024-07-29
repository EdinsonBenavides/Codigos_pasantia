require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",
  networks:{
    amoy: {
      url: "https://polygon-amoy.g.alchemy.com/v2/WCCpbH7LWuhhVDr3lnri9SisCJqWqSYm",
      accounts: ["c5eaf806e3d523a832711a0d96d1a5849019403b123abaf35fc9d6c1f8b77e15"],
    }
  }
};

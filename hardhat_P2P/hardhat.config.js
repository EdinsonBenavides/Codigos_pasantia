require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",
  networks:{
    amoy: {
      url: "https://polygon-amoy.g.alchemy.com/v2/WCCpbH7LWuhhVDr3lnri9SisCJqWqSYm",
      accounts: [""],
    }
  }
};

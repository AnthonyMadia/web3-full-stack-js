require("dotenv").config();
require("hardhat-deploy")
require("@nomiclabs/hardhat-etherscan");
require("@nomiclabs/hardhat-waffle");
require("hardhat-gas-reporter");
require("solidity-coverage");

const PRIVATE_KEY = process.env.PRIVATE_KEY
const RINKEBY_URL = process.env.RINKEBY_URL
const COIN_MRKT_API = process.end.COIN_API_KEY
const ETHERSCAN_API_KEY = process.env.ETHERSCAN_API_KEY


module.exports = {
  // solidity: "0.8.8",
  solidity: {
    compilers: [
      {version: "0.8.8"},
      {version: "0.6.6"}
    ]
  },
  defaultNetwork: "hardhat",
  networks: {
    rinkeby: {
      url: RINKEBY_URL || "",
      accounts: [PRIVATE_KEY],
      blockConfirmations: 6,
    },
  },
  gasReporter: {
    enabled: false,
    outputFile: "gas-report.txt",
    noColors: true,
    currency: "USD",
    coinmarketcap: COIN_MRKT_API,
    token: "MATIC",
  },
  etherscan: {
    apiKey: ETHERSCAN_API_KEY,
  },
  namedAccounts: {
    deployer: {
      default: 0,
      user: {
        default: 1, 
      },
    }
  }
};

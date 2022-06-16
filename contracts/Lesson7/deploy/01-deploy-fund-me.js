// import 
const { networkConfig } = require("../helper-hardhat-config")
const { network } = require("hardhat") 
// using namesless async function 

// module.exports = async (hre) => {
//     // pull out vairables and functions out of hardhat runtime environment (hre)
//     const { getNamedAccounts , deployments } = hre 
//     // same as hre.getNamedAccounts etc. 
// }

// syntatic sugar - Object Destructuring 
module.exports = async ({ getNamedAccounts, deployments }) => {
    const { deploy, log } = deployments 
    const { deployer } = await getNamedAccounts() 
    const chainId = network.config.chainId

    // if chainId is C use address Y
    const ethUsdPriceFeedAddress = networkConfig[chainId]["ethUsdPriceFeed"]

    // if the contract does not exist, we deploy a minimal version of it for local testing

    // when going for local host or hardhat network, we want to use a MOCK
    // what happens when we want to change chains?

    const fundMe = await deploy("FundMe", {
        from: deployer, 
        args: [

        ], // put price feed address 
        log: true
    })
}

module.exports.tags = ["all", "mocks"]
// async in contract development - have to wait for contract to be deployed 

// To compile code, using solc-js

// Ganache
// http://127.0.0.1:7545

const ethers = require("ethers")
// to read from abi and bin files 
const fs = require("fs-extra")
require("dotenv").config()


async function main() {
    const provider = new ethers.providers.JsonRpcProvider(process.env.RPC_URL)
    const wallet = new ethers.Wallet(
        process.env.PRIVATE_KEY,
        provider
    )
    const abi = fs.readFileSync("./SimpleStorage_sol_SimpleStorage.abi", "utf8")
    const binary = fs.readFileSync("./SimpleStorage_sol_SimpleStorage.bin", "utf8")

    const contractFactory = new ethers.ContractFactory(abi, binary, wallet)
    console.log("Deploying, please wait...")
    // deploy with ethers
    const contract = await contractFactory.deploy({
        gasPrice: 1000000000
    }) // STOP HERE! Wait for contract to deploy
    await contract.deployTransaction.wait(1)
    console.log(`Contract address: ${contract.address}`)

    // retrieve is a view function so will not cost any gas
    const currentFavoriteNumber = await contract.retrieve()
    console.log(currentFavoriteNumber.toString()) // stringify to make more readable

    const transactionResponse = await contract.store("7")
    const transactionReceipt = await transactionResponse.wait(1)
    const updatedfavoriteNumber = await contract.retrieve()
    console.log(`🚀 ~ updatedfavoriteNumber, ${updatedfavoriteNumber}`);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error)
        process.exit(1)
    })
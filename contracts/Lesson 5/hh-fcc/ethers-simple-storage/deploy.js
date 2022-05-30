// async in contract development - have to wait for contract to be deployed 

// To compile code, using solc-js

// Ganache
// http://127.0.0.1:7545

const ethers = require("ethers")
// to read from abi and bin files 
const fs = require("fs-extra")


async function main() {
    const provider = new ethers.providers.JsonRpcProvider("http://127.0.0.1:7545")
    const wallet = new ethers.Wallet(
        "5b538472f48fb953f5b2bea479a4916802dbe01bb6a3a93442291510cde7eed8",
        provider
    )
    const abi = fs.readFileSync("./SimpleStorage_sol_SimpleStorage.abi", "utf8")
    const binary = fs.readFileSync("./SimpleStorage_sol_SimpleStorage.bin", "utf8")
    const contractFactory = new ethers.ContractFactory(abi, binary, wallet)
    console.log("Deploying, please wait...")
    // deploy with ethers
    const contract = await contractFactory.deploy() // STOP HERE! Wait for contract to deploy
    console.log(contract)
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error)
        process.exit(1)
    })
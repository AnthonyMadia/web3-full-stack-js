// in nodejs
// requrie()

// in front-end js you can't use require
// use import
import { ethers } from "https://cdn.ethers.io/lib/ethers-5.2.esm.min.js"
import { abi, contractAddress } from "./constants.js"

// Cached element references
const connectButton = document.getElementById("connectButton")
const fundButton = document.getElementById("fund")

// Events
connectButton.onclick = connect
fundButton.onclick = fund

async function connect() {
  if (typeof window.ethereum !== "undefined") {
    try {
      await ethereum.request({ method: "eth_requestAccounts" })
    } catch (error) {
      console.log(error)
    }
    connectButton.innerHTML = "Connected"
    const accounts = await ethereum.request({ method: "eth_accounts" })
    console.log(accounts)
  } else {
    connectButton.innerHTML = "Please install MetaMask"
  }
}

// fund function
async function fund() {
  const ethAmount = "77"
  console.log(`Funding with ${ethAmount}`)
  if (typeof window.ethereum !== "undefined") {
    // need provider / connection to the blockchain
    // signer / wallet / someone with some gas
    // contract we are interacting with
    // need ^ ABI and Address
    const provider = new ethers.providers.Web3Provider(window.ethereum)
    const signer = provider.getSigner()
    const contract = new ethers.Contract(contractAddress, abi, signer)
    try {
      const transactionResponse = await contract.fund({
        value: ethers.utils.parseEther(ethAmount),
      })
      // hey, wait for this tx to be mined
      await listenForTransactionMine(transactionResponse, provider)
      console.log("Done!")
    } catch (error) {
      console.log(error)
    }
  }
}

function listenForTransactionMine(transactionResponse, provider) {
  console.log(`Mining ${transactionResponse.hash}...`)
  provider.once(transactionResponse.hash, (transactionReceipt) => {
    console.log(
      `Completed with ${transactionReceipt.confirmations} confirmations`
    )
  })
}

// withdraw

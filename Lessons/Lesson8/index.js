// in nodejs
// requrie()

// in front-end js you can't use require
// use import
import { ethers } from "https://cdn.ethers.io/lib/ethers-5.2.esm.min.js"

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
async function fund(ethAmount) {
  console.log(`Funding with ${ethAmount}`)
  if (typeof window.ethereum !== "undefined") {
    // need provider / connection to the blockchain
    // signer / wallet / someone with some gas
    // contract we are interacting with
    // need ^ ABI and Address
  }
}

// withdraw

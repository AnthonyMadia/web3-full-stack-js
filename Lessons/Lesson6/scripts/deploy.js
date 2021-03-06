// imports 
const { ethers, network } = require("hardhat")


// async main 
async function main() {
  const SimpleStorageFactory = await ethers.getContractFactory(
    "SimpleStorage"
  )
  console.log("Deploying contract...")
  const simpleStorage = await SimpleStorageFactory.deploy()
  await simpleStorage.deployed()
  console.log(`Deployed contract to: ${simpleStorage.address}`)
  
  if (network.config.chainId === 4 && process.env.ETHERSCAN_API_KEY) {
    await simpleStorage.deployTransaction.wait(6)
    await verify(simpleStorage.address, [])
  }

  const currentValue = await simpleStorage.retrieve() 
  console.log(`Current value is: ${currentValue}`)

  // update current Value 
  const transactionResponse = await simpleStorage.store(7)
  await transactionResponse.wait(1)
  const updatedValue = await simpleStorage.retrieve()
  console.log(`Updated Value is ${updatedValue}`)
}

// verify 
async function verify (contractAddress, args) {
  console.log("Verifying contract...")
  try {
    await run("verify:verify", {
      address: contractAddress,
      constructorArguments: args
    })
  } catch (e) {
    if (e.message.toLowerCase().includes("already verified")) {
      console.log("Already Verified")
    } else {
      console.log(e)
    }
  }
    
}

// main
main()
  .then(() => process.exit())
  .catch((error) => {
    console.error(error)
    process.exit(1)
  })
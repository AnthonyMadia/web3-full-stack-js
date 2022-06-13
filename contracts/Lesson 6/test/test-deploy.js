const { ethers } = require("hardhat")
const {expect, asset, assert} = require("chai")

// describe takes two parameters: String and Callback

describe("SimpleStorage", () => {
  // before each says what to do before each of the its
    // in this case, we are deploying the contract before running the its
  let SimpleStorageFactory
  let simpleStorage
  beforeEach(async function () {
    SimpleStorageFactory = await ethers.getContractFactory(
      "SimpleStorage"
    )
    simpleStorage = await SimpleStorageFactory.deploy()
  }) 

  it("Should start with a favorite number of 0", async function () {
    const currentValue = await simpleStorage.retrieve()
    const expectedValue = "0"

    assert.equal(currentValue.toString(), expectedValue)
  }) 

  it("Should update when we call store", async function() {
    expectedValue = "7"
    const transactionResponse = await simpleStorage.store(expectedValue)
    await transactionResponse.wait(1)
  })
})
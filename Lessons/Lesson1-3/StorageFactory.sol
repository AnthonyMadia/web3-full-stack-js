// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol"; // automatically get ABI from importing contract

// manage simple storage contracts by putting them in an array and calling functions on them
contract StorageFactory {
    SimpleStorage[] public simpleStorageArray;

    // create function to deploy our simple storage contract
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage); // storing contract in SimpleStorage array
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // Address - stored in simpleStorage array
        // ABI
        // need contract object
        return simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        // retrieve function is being called on a simpleStorage object so this works
        return simpleStorageArray[_simpleStorageIndex].retrieve();
    
    }
}

// Application Binary Interface
    // Tells our code how to interact with our contract

// StortageFactory allows to create simpleStorage Contracts, saves contract to simple storage array and allows us to call functions of those contracts (store and read values from storageFACTORY contract for any contracts we created)
    // We can call retrieve function directly on the index in array
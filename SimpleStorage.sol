// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7; // ^ and >= < operators for version control

// think of a contract like a class
// Every single smart contract has an address
contract SimpleStorage {
    // default value is 0
    // default visibility is internal
    // favoriteNumber is in global scope

    // set to public, these variables contain a GETTER function 
    uint public favoriteNumber;
    People public person = People({favoriteNumber: 2, name: "Dory"});

    // now, we can use this People type
    struct People {
        uint256 favoriteNumber;
        string name;
    }

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber; // semi here not after }
       
    }

    // store is ORANGE in remix
        // ORANGE are functions that do not have to spend gas to run
        // VIEW and PURE
    // View means a function that we are only going to read State off of contract
        // For example, retrieve function is just going to read what our favoriteNumber is
        // remember, Gas is only spent when we change state of the blockchain
    // View and pure functions do not allow modifications of state
    

    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }
    // Pure functions additionally disallow you to read from blockchain state
    function add() public pure returns (uint256) {
        return (1 + 1);
    }
    // view or pure functions only costs gas when a gas function calls it
}

// Basic Solidity Arrays and Structs
    // Struct example
        // store different people who have different favoriteNumbers








// Contract address: 0xd9145CCE52D386f254917e481eB44e9943F39138

// Any time you change something on-chain, including making a new contract, it happens in a transaction

// public variable
    // resembles function to show number

// Visibility Specifiers
    // public - creates a getter function for storage/state variables
    // private - only visible in the current contract
    // external - only visible externally - i.e. can only be message-called
    // internal - only visible internally

// The more computation the function does, the more gas it costs
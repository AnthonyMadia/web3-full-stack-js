// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7; // ^ and >= < operators for version control

// think of a contract like a class
// Every single smart contract has an address
contract SimpleStorage {
    // default value is 0
    uint public favoriteNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber; // semi here not after }
    }
}

// Contract address: 0xd9145CCE52D386f254917e481eB44e9943F39138

// Any time you change something on-chain, including making a new contract, it happens in a transaction

// public variable
    // resembles function to show number

// Visibility Specifiers
    // public - creates a getter function for storage/state variables
    // private - only visible in the current contract
    // external - only visible externally - i.e. can only be message-called
    // internal - only visible internally
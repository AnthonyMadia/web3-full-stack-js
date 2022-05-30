// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Inheritance
    // have extra storage contract be a child of simple storage contract

import "./SimpleStorage.sol";

// Extra Storage is exact same as Simple Storage and inherit functions
contract ExtraStorage is SimpleStorage {
    // + 5 to any number 
    // overriding functions
    // Virtual ||  Override
        // "Overriding function is missing "override" specifier"
        // need to override keyword to change the functionality of parent function
    function store(uint256 _favoriteNumber) public override {
        favoriteNumber = _favoriteNumber + 5;
    }
}
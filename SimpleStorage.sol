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

    // KEY => VALUE
    mapping(string => uint256) public nameToFavoriteNumber;

    // now, we can use this People type
    struct People {
        uint256 favoriteNumber;
        string name;
    }
    // use array for a struct list; [] empty array is DYNAMIC
    // [3] can only have max of 3
    People[] public people; 

    // function that adds people to our array
    function addPeople(string memory _name, uint256 _favoriteNumber) public {
        // create newPerson variable with type People
            // with this method, we need memory keyword
        // People memory newPerson = People(_favoriteNumber, _name);
        // Lowercase people is reffering to the array not struct People
        people.push(People(_favoriteNumber, _name));

        // add people to MAPPING
        nameToFavoriteNumber[_name] = _favoriteNumber;
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


// Errors
    // don't forget semicolon

// Memory, Storage, and Calldata
    // EVM can access and store information in six places:
        // stack
        // Memory
        // Storage
        // Calldata
        // Code 
        // Logs

    // Calldata, Memory, and Storage
        // Calldata and Memory mean variable will be temporary
            // if a variable is calldata, you cannot reassign it
            // memory varibles CAN be modified
        // Storage variables are *permenant* variables that *can* be modified
        // Solidity knows uint256 is held in memory so no need write memory keyword
        // string is an array of bytes 

    // We cannot say a variable is Stack, Code, or Logs

// Mapping datastructure (more efficient look up)
    // mapping is a data structure where a key is "mapped" to a single value (object in JS)
    // When you create a mapping, you initialize everything to its' null value




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


// Deploying Contract
    // 
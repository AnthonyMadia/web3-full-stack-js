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
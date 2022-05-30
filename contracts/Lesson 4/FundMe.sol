// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "./PriceConverter.sol";

error NotOwner();

contract FundMe {
    using PriceConverter for uint256;

    // addresses (key) =>  money (VALUE)
    mapping(address => uint256) public addressToAmountFunded;
    address[] public funders;

    // Could we make this constant?  /* hint: no! We should make it immutable! */
    address public /* immutable */ i_owner;
    uint256 public constant MINIMUM_USD = 50 * 10 ** 18;
    
    constructor() {
        i_owner = msg.sender; // keeps track of who sends money to contract
    }

    function fund() public payable {
        require(msg.value.getConversionRate() >= MINIMUM_USD, "You need to spend more ETH!");
        // require(PriceConverter.getConversionRate(msg.value) >= MINIMUM_USD, "You need to spend more ETH!");
        addressToAmountFunded[msg.sender] += msg.value;
        funders.push(msg.sender);
    }
    
    function getVersion() public view returns (uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        return priceFeed.version();
    }
    
    modifier onlyOwner {
        // require(msg.sender == owner);
        if (msg.sender != i_owner) revert NotOwner();
        _;
    }
    
    function withdraw() payable onlyOwner public {
        for (uint256 funderIndex=0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        funders = new address[](0);
        // // transfer
        // payable(msg.sender).transfer(address(this).balance);
        // // send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send failed");
        // call
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }
    // Explainer from: https://solidity-by-example.org/fallback/
    // Ether is sent to contract
    //      is msg.data empty?
    //          /   \ 
    //         yes  no
    //         /     \
    //    receive()?  fallback() 
    //     /   \ 
    //   yes   no
    //  /        \
    //receive()  fallback()

    fallback() external payable {
        fund();
    }

    receive() external payable {
        fund();
    }
}

// How do we send ETH to this contract?
    // Whenever contract is created on EVM blockchains there is a value field you can set with the transactions
    
    // Every single Transation will have these fields
        // Nonce: tx count for the account
        // Gas Price: price per unit of gas (in wei)
        // Gas Limit: max gas that this tx can use
        // To: address that the tx is sent to 
        // value: amount of wei to send
        // Data: what to send to the To address
        // v, r, s: components of tx signature

// Smart contracts can hold funds just how wallets can

// Reverting
    // undo any action that happened before, and sends remaining gas back
        // With revert, if the require condition is not met, it would undo setting the number variable to 5!
        // Gas is spent because we are changing state
        // number = 5;
    // uint256 public number;

// Interfaces & Price Feeds
    // smart contract kit example
    // Aggregator V3 Interface 
        // function declarations but no logic is implemented! this is an interface
        // if you compile this, we will get ABI because it defines all the different ways we can interact with the contract

// Importing from GitHub and NPM
    // npm 

// Whenver working with another conttract we need ABI and Address of that contract:
    // When compiled, an INTERFACE gives us a minimalistic ABI to interact with contracts outside of our project
    // When you combine compiled interface with with an address, you can call the functions of the interface on that contract

// msg.value and msg.sender 
    // globally available values 
    // msg.sender represents sender of message of tx
    // msg.value represents number of WEI sent with message

// Libraries
    // Libraries are similar to contract, but you cannot declare any state variable and you cannot send either
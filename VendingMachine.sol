// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.17;

contract VendingMachine {

    // Declare state variables of the contract
    address public owner;
    mapping (address => uint) public donutBalances;

    // When 'VendingMachine' contract is deployed:
    // 1. set the deploying address as the owner of the contract
    // 2. set the deployed smart contract's donut balance to 100
    constructor() {
        owner = msg.sender;
        donutBalances[address(this)] = 100;
    }
//represents the balance of the donuts that are associated with the current Ethereum account.
    function getBalance() public view returns (uint) {

    return donutBalances[address(this)];

    }
    // Allow the owner to increase the smart contract's donut balance
    function restock(uint amount) public {
        require(msg.sender == owner, "Only the owner can restock.");
        donutBalances[address(this)] += amount;
    }

    // Allow anyone to purchase donuts
    function purchase(uint amount) public payable {
        require(msg.value >= amount * 1 ether, "You must pay at least 1 ETH per donut");
        require(donutBalances[address(this)] >= amount, "Not enough donuts in stock to complete this purchase");
        donutBalances[address(this)] -= amount;
        donutBalances[msg.sender] += amount;
    }
}

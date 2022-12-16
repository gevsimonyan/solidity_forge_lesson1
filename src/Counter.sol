// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    uint256 public number;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not owner!");
        _;        
    }

    function changeOwner(address newOwner) public onlyOwner {
        // reqqire(expression, "Erro Message")
        // revert("Error message");
        // assert(msg.sender == owner);
        // if(msg.sender != owner) {
        //     revert("You are not the owner!");
        // }
        owner = newOwner;
    }

    function setNumber(uint256 newNumber) public onlyOwner {
        number = newNumber;
    }

    function increment() public onlyOwner {
        number += 2;
    }
}

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Registration {

    address public owner;
    mapping(address => bool) public registeredUsers;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyRegisteredUser() {
        require(registeredUsers[msg.sender], "Only registered users");
        _;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner!");
        _;
    }

    modifier onlyLessThen10000(uint256 amount) {
        require(amount <= 10000, "Only less then 10k!");
        _;
    }


    function registration(address user) public {
        registeredUsers[user] = true;
    }

    function deleteUser(address user) public {
        registeredUsers[user] = false;
    }

    function deposit() public payable onlyRegisteredUser {}

    function withdraw(uint256 amount) public onlyRegisteredUser onlyLessThen10000(amount) {}



} 
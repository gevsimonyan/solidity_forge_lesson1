// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Registration.sol";

contract RegistrationTest is Test {
    Registration public registration;

    function setUp() public {
        registration = new Registration();
    }

    function testRegistration() public {
        registration.registration(0x71C7656EC7ab88b098defB751B7401B5f6d8976F);
        assertEq(registration.registeredUsers(0x71C7656EC7ab88b098defB751B7401B5f6d8976F), true);
    }


    function testDeleteUser() public {
        registration.registration(0x9907A0cF64Ec9Fbf6Ed8FD4971090DE88222a9aC);
        registration.deleteUser(0x9907A0cF64Ec9Fbf6Ed8FD4971090DE88222a9aC);
        assertEq(registration.registeredUsers(0x9907A0cF64Ec9Fbf6Ed8FD4971090DE88222a9aC), false);
    }

}

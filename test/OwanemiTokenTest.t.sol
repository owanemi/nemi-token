// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import {Test} from "lib/forge-std/src/Test.sol";
import {OwanemiToken} from "src/OwanemiToken.sol";
import {DeployOwanemiToken} from "script/DeployOwanemiToken.s.sol";


contract OwanemiTokenTest is Test {
    OwanemiToken public owanemitoken;
    DeployOwanemiToken public deployer;
    
    uint256 public constant STARTING_BALANCE = 100 ether;

    address Owanemi = makeAddr("Owanemi");
    address Sotonye = makeAddr("Sotonye");

    function setUp() external {
        deployer = new DeployOwanemiToken();
        owanemitoken = deployer.run();

        vm.prank(msg.sender);
        owanemitoken.transfer(Owanemi, STARTING_BALANCE);
    }

    function testOwanemiBalance() public {
        assertEq(STARTING_BALANCE, owanemitoken.balanceOf(Owanemi));
    }

    // function testTransfer() public {
    //     owanemitoken.transfer(Sotonye, 10 ether);
    //     assertEq(owanemitoken.balanceOf(Sotonye), 10 ether);
    //     assertEq(owanemitoken.balanceOf(Owanemi), 90 ether);
    // }
}
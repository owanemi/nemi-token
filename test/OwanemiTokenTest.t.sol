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

    function testAllowancesWorks() public {
        uint256 initialAllowance = 1000;

        vm.prank(Owanemi);
        owanemitoken.approve(Sotonye, initialAllowance);

        uint256 transferAmount = 500;

        vm.prank(Sotonye);
        owanemitoken.transferFrom(Owanemi, Sotonye, transferAmount);

        assertEq(owanemitoken.balanceOf(Sotonye), transferAmount);
        assertEq(owanemitoken.balanceOf(Owanemi), STARTING_BALANCE - transferAmount);
    }
}

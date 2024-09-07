// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import {Script} from "lib/forge-std/src/Script.sol";
import {OwanemiToken} from "src/OwanemiToken.sol";

contract DeployOwanemiToken is Script {

    uint256 public constant INITIAL_SUPPLY = 1e6 ether;

    function run() external returns (OwanemiToken) {
        vm.startBroadcast();
        OwanemiToken owanemitoken = new OwanemiToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return owanemitoken;
    }
}

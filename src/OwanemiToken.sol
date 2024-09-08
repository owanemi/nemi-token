// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import {ERC20} from "lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract OwanemiToken is ERC20 {
    constructor(uint256 _initialSupply) ERC20("OWANEMI-TOKEN", "NEMI") {
        _mint(msg.sender, _initialSupply);
    }
}

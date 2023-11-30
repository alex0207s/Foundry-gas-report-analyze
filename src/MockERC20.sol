// SPDX-License-Identifier: MIT
pragma solidity =0.8.7;

import {ERC20} from "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract MockERC20 is ERC20("TEST", "TST") {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not the owner");
        _;
    }

    function mint(address account, uint256 value) public onlyOwner {
        _mint(account, value);
    }

    function transfer(
        address to,
        uint256 value,
        bool open
    ) public returns (bool) {
        if (open) {
            if (value != balanceOf(msg.sender)) {
                return transfer(to, value);
            } else {
                return transfer(to, value - 1);
            }
        } else {
            return transfer(to, value);
        }
    }

    function transferFrom(
        address from,
        address to,
        uint256 value,
        bool open
    ) public returns (bool) {
        if (open) {
            if (value != balanceOf(from)) {
                return transferFrom(from, to, value);
            } else {
                return transferFrom(from, to, value - 1);
            }
        } else {
            return transferFrom(from, to, value);
        }
    }
}

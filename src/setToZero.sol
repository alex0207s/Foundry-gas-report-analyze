// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract SetToZero {
    uint256 num = 1;

    function setToZero() external payable {
        num = 0;
    }
}

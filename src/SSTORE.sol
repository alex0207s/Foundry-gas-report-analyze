// SPDX-License-Identifier: MIT
pragma solidity =0.8.7;

contract SSTORE {
    uint256 remainSame = 99;
    uint256 zero;
    uint256 one = 1;

    function case1() external payable {
        remainSame = 99;
    }

    function case2() external payable {
        zero = 1;
    }

    function case3() external payable {
        one = 2;
    }

    function case4() external payable {
        one = 0;
    }
}

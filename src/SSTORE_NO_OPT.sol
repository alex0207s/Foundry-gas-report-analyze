// SPDX-License-Identifier: MIT
pragma solidity =0.8.7;

contract SSTORE_NO_OPT {
    uint256 warmSlotOne = 1;
    uint256 warmSlotTwo = 2;
    uint256 warmSlotZero;

    function case5() external payable {
        warmSlotOne = 0;
        warmSlotOne = 2;
    }

    function case6() external payable {
        //orig_val != 0 current != 0 new_val = 0
        warmSlotOne = 2;
        warmSlotOne = 0;
    }

    function case7() external payable {
        // orig_val = 0 new_val = 0
        warmSlotZero = 1;
        warmSlotZero = 0;
    }

    function case8() external payable {
        warmSlotTwo = 1;
        warmSlotTwo = 2;
    }
}

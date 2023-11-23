// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import {Test, console2} from "forge-std/Test.sol";
import {DoNothing} from "src/doNothing.sol";
import {SetNumber} from "src/setNumber.sol";
import {SetToZero} from "src/setToZero.sol";

contract ExampleTest is Test {
    DoNothing doNothingC;
    SetToZero setToZeroC;
    SetNumber setNumberC;

    function setUp() public {
        doNothingC = new DoNothing();
        setToZeroC = new SetToZero();
        setNumberC = new SetNumber();
    }

    function testDoNothing() external {
        // local test 74
        // uint begin = gasleft();
        // doNothingC.doNothing();
        // emit log_named_uint("gas usage", begin - gasleft());

        doNothingC.doNothing();
    }

    function testSetToZero() external {
        // local test 4074
        // uint begin = gasleft();
        // setToZeroC.setToZero();
        // emit log_named_uint("gas usage", begin - gasleft());

        setToZeroC.setToZero();
    }

    function testSetNumber() external {
        // local test 4133
        // uint begin = gasleft();
        // setNumberC.setNumber(0);
        // emit log_named_uint("gas usage", begin - gasleft());

        setNumberC.setNumber(0);
    }

    function testSetNumber2() external {
        // local test 5166
        // uint begin = gasleft();
        // setNumberC.setNumber(2);
        // emit log_named_uint("gas usage", begin - gasleft());

        setNumberC.setNumber(2);
    }
}

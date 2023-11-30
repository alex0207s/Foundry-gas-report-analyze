// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.7;

import {Test, console2} from "forge-std/Test.sol";
import {IExample} from "src/interfaces/IExample.sol";

contract ExampleForkTest is Test {
    address private from;
    uint256 private block_number;

    IExample private doNothingC;
    IExample private setToZeroC;
    IExample private setNumberC;

    function setUp() public {
        from = vm.envAddress("FROM");

        doNothingC = IExample(0x66363aF11c748aD4882c49cfE42202E3E473B64B);
        setToZeroC = IExample(0x8267b6D93Eab4aa1F638Da1a5E91e4359312bE33);
        setNumberC = IExample(0x742F1767873D6Ef53A801A3F11183Ec6FD70B477);
    }

    function testDoNothing() public {
        block_number = 4657450;

        string memory url = vm.rpcUrl("sepolia");
        vm.createSelectFork(url, block_number);

        // gas usage in test: 74
        vm.startPrank(from, from);
        doNothingC.doNothing();
        // address(0x66363aF11c748aD4882c49cfE42202E3E473B64B).call(
        //     abi.encode("doNothing()")
        // );
        vm.stopPrank();
    }

    function testSetToZero() public {
        block_number = 4657455;

        string memory url = vm.rpcUrl("sepolia");
        vm.createSelectFork(url, block_number);

        // gas usage in test: 4074
        vm.startPrank(from, from);
        setToZeroC.setToZero();
        // address(0x8267b6D93Eab4aa1F638Da1a5E91e4359312bE33).call(
        //     abi.encodeWithSignature("setToZero()")
        // );
        vm.stopPrank();
    }

    function testSetNumber() external {
        block_number = 4657459;
        string memory url = vm.rpcUrl("sepolia");
        vm.createSelectFork(url, block_number);

        // gas usage in test: 4133
        vm.startPrank(from, from);
        setNumberC.setNumber(0);
        // address(0x742F1767873D6Ef53A801A3F11183Ec6FD70B477).call(
        //     abi.encodeWithSignature("setNumber(uint256)", 0)
        // );
        vm.stopPrank();
    }

    function testSetNumber2() external {
        block_number = 4657459;
        string memory url = vm.rpcUrl("sepolia");
        vm.createSelectFork(url, block_number);

        // gas usage in test: 5166
        vm.startPrank(from, from);
        setNumberC.setNumber(2);
        // address(0x742F1767873D6Ef53A801A3F11183Ec6FD70B477).call(
        //     abi.encodeWithSignature("setNumber(uint256)", 2)
        // );
        vm.stopPrank();
    }
}

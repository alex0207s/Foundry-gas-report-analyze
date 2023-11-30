// SPDX-License-Identifier: MIT
pragma solidity =0.8.7;

import {Test, console2} from "forge-std/Test.sol";
import {MockERC20} from "src/MockERC20.sol";

contract MockERC20Test is Test {
    MockERC20 mockERC20;

    address alice = vm.addr(1);
    address bob = vm.addr(2);
    address carol = vm.addr(3);

    function setUp() public {
        vm.label(alice, "alice");
        vm.label(bob, "bob");
        vm.label(carol, "carol");

        mockERC20 = new MockERC20();

        mockERC20.mint(alice, 10 wei);
        mockERC20.mint(bob, 10 wei);
        mockERC20.mint(carol, 10 wei);
    }

    function testTransferAll() external {
        // scenario
        // a -> b -> c
        // c -> b -> a

        // a -> b
        vm.startPrank(alice);
        mockERC20.transfer(bob, mockERC20.balanceOf(alice), false);
        vm.stopPrank();
        // b -> c
        vm.startPrank(bob);
        mockERC20.transfer(carol, mockERC20.balanceOf(bob), false);
        vm.stopPrank();
        // c -> b
        vm.startPrank(carol);
        mockERC20.transfer(bob, mockERC20.balanceOf(carol), false);
        vm.stopPrank();
        // b -> a
        vm.startPrank(bob);
        mockERC20.transfer(alice, mockERC20.balanceOf(bob), false);
        vm.stopPrank();
    }

    function testLeaveOneWei() external {
        // scenario
        // a -> b -> c
        // c -> b -> a

        // a -> b

        vm.startPrank(alice);
        mockERC20.transfer(bob, mockERC20.balanceOf(alice), true);
        vm.stopPrank();

        // b -> c
        vm.startPrank(bob);
        mockERC20.transfer(carol, mockERC20.balanceOf(bob), true);
        vm.stopPrank();

        // c -> b
        vm.startPrank(carol);
        mockERC20.transfer(bob, mockERC20.balanceOf(carol), true);
        vm.stopPrank();

        // b -> a
        vm.startPrank(bob);
        mockERC20.transfer(alice, mockERC20.balanceOf(bob), true);
        vm.stopPrank();
    }
}

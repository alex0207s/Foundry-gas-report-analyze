// SPDX-License-Identifier: MIT
pragma solidity =0.8.7;

import {Script, console2} from "forge-std/Script.sol";
import {MockERC20} from "src/MockERC20.sol";

contract MockERC20Script is Script {
    MockERC20 mockERC20;

    address private alice = vm.envAddress("ALICE");
    address private bob = vm.envAddress("BOB");
    address private carol = vm.envAddress("CAROL");

    function setUp() public {
        mockERC20 = MockERC20(0x916A9d59a0e7d5B8CbC720dAC91Ae0be56DA27D6);
    }

    function run() public {
        uint256 alicePk = vm.envUint("ALICE_PRIVATE_KEY");
        uint256 bobPk = vm.envUint("BOB_PRIVATE_KEY");
        uint256 carolPk = vm.envUint("CAROL_PRIVATE_KEY");

        vm.startBroadcast(alicePk);
        mockERC20.mint(alice, 10 wei);
        mockERC20.mint(bob, 10 wei);
        mockERC20.mint(carol, 10 wei);
        vm.stopBroadcast();

        // scenario
        // a -> b -> c
        // c -> b -> a

        // on-chain
        // with true total 249637
        // with false total 263629

        // forge test
        // with true 53127
        // with false 42446

        // a -> b
        vm.startBroadcast(alicePk);
        mockERC20.transfer(bob, mockERC20.balanceOf(alice), false);
        vm.stopBroadcast();

        // b -> c
        vm.startBroadcast(bobPk);
        mockERC20.transfer(carol, mockERC20.balanceOf(bob), false);
        vm.stopBroadcast();

        // c -> b
        vm.startBroadcast(carolPk);
        mockERC20.transfer(bob, mockERC20.balanceOf(carol), false);
        vm.stopBroadcast();

        // b -> a
        vm.startBroadcast(bobPk);
        mockERC20.transfer(alice, mockERC20.balanceOf(bob), false);
        vm.stopBroadcast();
    }
}

// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.7;

import {Script, console2} from "forge-std/Script.sol";
import {IExample} from "src/interfaces/IExample.sol";

contract ExampleScript is Script {
    IExample doNothingC;
    IExample setToZeroC;
    IExample setNumberC;

    function setUp() public {
        doNothingC = IExample(0x66363aF11c748aD4882c49cfE42202E3E473B64B);
        setToZeroC = IExample(0x8267b6D93Eab4aa1F638Da1a5E91e4359312bE33);
        setNumberC = IExample(0x742F1767873D6Ef53A801A3F11183Ec6FD70B477);
    }

    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(privateKey);

        // case1: doNothing
        // estimate 74 ; on-chain gas usage 21138 = 21000 + 74 + 64
        doNothingC.doNothing();

        // case 2: setToZero
        // estimate 4074 ; on-chain gas usage 21356 = 21000 + 5092 + 64 - 4800
        setToZeroC.setToZero();

        // case 3: setNumber
        // estimate 4133 ; on-chain gas usage 21558 = 21000 + 5166 + 192 - 4800
        setNumberC.setNumber(0);

        vm.stopBroadcast();
    }
}

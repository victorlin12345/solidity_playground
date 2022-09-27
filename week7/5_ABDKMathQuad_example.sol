// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./ABDKMathQuad.sol";
import "./ABDKMath64x64.sol";

contract TestABDKMathQuad{    

    using ABDKMathQuad for bytes16;
    using ABDKMath64x64 for int256;

    function ConvertQuad(int256 i) public pure returns (bytes16) {
        return ABDKMathQuad.from64x64(ABDKMath64x64.fromInt(i));
    }

    function Convert64x64(bytes16 b) public pure returns (int128) {
        return ABDKMathQuad.to64x64(b);
    }

    /*
    sign bit: 1 bit,
    exponent: 15 bits,
    significand precision: 113 bits (112 explicitly stored).
    bytes16 -> 8 x 16 = 128 = 1 + 15 + 112
    */
    // function div (bytes16 x, bytes16 y) internal pure returns (bytes16)
    // 2 -> 0x40000000000000000000000000000000
    // 9 -> 0x40022000000000000000000000000000
    // 0x3ffcc71c71c71c71c71c71c71c71c71c -> 64x64: 4099276460824344803
    // >>> 4099276460824344803/18446744073709551616
    // 0.2222222222222222
    function ABDKMathQuadDiv(bytes16 x, bytes16 y) public pure returns (bytes16) {
        return ABDKMathQuad.div(x, y);
    } 

     // function sign (bytes16 x) internal pure returns (int8)
    function ABDKMathQuadSign(bytes16 x) public pure returns (int8) {
        return ABDKMathQuad.sign(x);
    } 

}
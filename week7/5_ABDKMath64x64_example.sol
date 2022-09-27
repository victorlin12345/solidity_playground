// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./ABDKMath64x64.sol";

contract TestABDKMath64x64{    

    using ABDKMath64x64 for int256;

    // function fromInt (int256 x) internal pure returns (int128)
    /*
    有符號的 64.64 位定點數基本上是一個簡單的分數，
    其分子是有符號的 128 位整數，分母是 2^64。 
    只要分母始終相同，就不需要存儲它，
    因此在 Solidity 中，有符號的 64.64 位定點數由僅包含分子的 int128 類型表示。
    python3 算法
    >>> 2**64
    18446744073709551616
    >>> 18674469129299496030699520/18446744073709551616
    1012345.0
    */
    function get64x64(int256 i) public pure returns (int128) {
        return ABDKMath64x64.fromInt(i);
    }

    // function div (int128 x, int128 y) internal pure returns (int128)
    /*
    >>> 2**64
    18446744073709551616
    >>> 4099276460824344803/18446744073709551616
    0.2222222222222222
    >>> 2/9
    0.2222222222222222
    */
    function exampleABDKMath64x64Div() public pure returns (int128) {
        int128 a = ABDKMath64x64.fromInt(2);
        int128 b = ABDKMath64x64.fromInt(9);
        return ABDKMath64x64.div(a, b);
    }
}
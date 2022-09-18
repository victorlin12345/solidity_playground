// SPDX-License-Identifier: GPL-3.0
pragma solidity >0.7.0 < 0.9.0;

contract AbiDecode {

    struct MyStruct {
        string name;
        uint[2] nums;
    }

    function encode(uint x,
    address addr,
    uint[] calldata arr,
    MyStruct calldata myStruct
    ) external pure returns (bytes memory) {
        return abi.encode(x, addr, arr, myStruct);
    }

    function decode(bytes calldata data) external pure returns (
        uint x,
        address addr,
        uint[] memory arr, 
        MyStruct memory myStruct
    ) {
        (x, addr, arr, myStruct) = abi.decode(data, (uint, address, uint[], MyStruct));
    }

}
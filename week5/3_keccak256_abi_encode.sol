// SPDX-License-Identifier: MIT
pragma solidity >0.7.0 < 0.9.0;

contract HashFunc {

    function hash(string memory text, uint8 num, address addr) external pure returns (bytes32) {
        // abi.encodePacked(args...)
        return keccak256(abi.encodePacked(text, num, addr));
    }

    // abi.encode 會為 32 bytes 的倍數
    function encode(string memory text0, string memory text1) external pure returns (bytes memory) {
        return abi.encode(text0, text1);
    }

    // abi.encode 經過 compress 後的 bytes
    // encodePacked("AAA", "ABBB") -> 0x41414141424242
    // encodePacked("AAAA", "BBB") -> 0x41414141424242
    function encodePacked(string memory text0, string memory text1) external pure returns (bytes memory) {
        return abi.encodePacked(text0, text1);
    }

    // 增加一個 i 後，看是否有改善 collision
    // encodePacked2("AAA", 123, "ABBB") -> 0x414141000000000000000000000000000000000000000000000000000000000000007b41424242
    // encodePacked2("AAAA", 123, "BBB") -> 0x41414141000000000000000000000000000000000000000000000000000000000000007b424242
    function encodePacked2(string memory text0, uint i, string memory text1) external pure returns (bytes memory) {
        return abi.encodePacked(text0, i, text1);
    }

}
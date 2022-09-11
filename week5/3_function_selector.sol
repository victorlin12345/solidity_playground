// SPDX-License-Identifier: MIT
pragma solidity >0.7.0 < 0.9.0;

contract Receiver {

    event Log(bytes data);

    function transfer(address _to, uint _amount) external {
        emit Log(msg.data);
        // 0xa9059cbb (function selector)
        // 0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc4 (參數1)
        // 00000000000000000000000000000000000000000000000000000000000003e8 (參數2)
    }

}

contract FunctionSelect {

    // 取前4個bytes(keccak256(bytes(function signature)))
    function getSelect(string calldata _func) external pure returns (bytes4) {
        return bytes4(keccak256(bytes(_func))); // 0xa9059cbb
    }

}
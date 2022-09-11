// SPDX-License-Identifier: MIT
pragma solidity >0.7.0 < 0.9.0;

/*
input:
{
	"address _to": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
	"uint256 _amount": "100"
}

1. 了解 function signature, function selector 是捨？
2. 使用 call 配合 abi.encodeWithSignature, abi.encodeWithSelector 呼叫 function
*/
contract Receiver {

    event Log(bytes data);

    function transfer(address _to, uint _amount) external {
        emit Log(msg.data);
        // 0xa9059cbb (function selector)
        // 0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc4 (參數1)
        // 0000000000000000000000000000000000000000000000000000000000000064 (參數2)
    }

    function executeWithSignature(address _to, uint _amount) external {
       (bool success, ) = address(this).call(abi.encodeWithSignature("transfer(address,uint256)", _to, _amount));
        // 0xa9059cbb
        // 0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc4
        // 0000000000000000000000000000000000000000000000000000000000000064
    }

    function executeWithSelector(address _to, uint _amount) external {
       (bool success, ) = address(this).call(abi.encodeWithSelector(0xa9059cbb, _to, _amount));
        // 0xa9059cbb
        // 0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc4
        // 0000000000000000000000000000000000000000000000000000000000000064
    }

}

contract FunctionSelect {
    // function signature: transfer(address,uint256)
    // 取前4個bytes(keccak256(bytes(function signature)))
    function getSelect(string calldata _func) external pure returns (bytes4) {
        return bytes4(keccak256(bytes(_func))); // 0xa9059cbb
    }

}
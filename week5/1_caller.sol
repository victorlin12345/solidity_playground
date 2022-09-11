// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

interface targetInterface {
    function returnTxAddress() external view returns(address);
    function returnMsgAddress() external view returns(address);
}

// 測試 msg.sender 會是誰？tx.origin 會是誰？並找出差異性
contract Caller {

    address beCalledAddress = 0x1c91347f2A44538ce62453BEBd9Aa907C662b4bD;
    targetInterface i = targetInterface(beCalledAddress);
    
    function wrapTxAddress() public view returns (address) {
        return i.returnTxAddress();
    }

    function wrapMsgAddress() public view returns (address) {
        return i.returnMsgAddress();
    }

}
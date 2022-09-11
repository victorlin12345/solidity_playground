// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// 此合約將被另一個合約呼叫，並藉由呼叫方看出 msg.sender 與 tx.origin 的差異
contract TxOriginPractice {

    function returnTxAddress() public view returns (address) {
        return tx.origin;
    }

    function returnMsgAddress() public view returns (address) {
        return msg.sender;
    }

}
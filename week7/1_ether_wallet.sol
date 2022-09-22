// SPDX-License-Identifier: MIT

pragma solidity >0.7.0 <0.9.0;

contract EtherWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    // 加值
    receive() payable external {}

    // 提款
    function withdraw(uint _amount) external {
        require(msg.sender == owner, "caller is not owner");
        // 1. 節省 gas: 將 owner.transfer(_amount) 變成以下，使 function 中少使用一次 state variable
        // 2. 上述等同於下方
        // (bool sent, ) = msg.sender.call{value: _amount}("");
        // require(sent, "failed to send ether")
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }

}
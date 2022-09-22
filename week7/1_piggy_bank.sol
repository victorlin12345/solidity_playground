// SPDX-License-Identifier: MIT

pragma solidity >0.7.0 <0.9.0;

contract PiggyBank {

    event Deposit(uint _amount);
    event Withdraw(uint _amount);

    address owner = msg.sender;

    receive() payable external {
        emit Deposit(msg.value);
    }

    // 只有 owner 可以提領，並毀壞合約
    function withdraw() external {
        require(msg.sender == owner, "not owner");
        emit Withdraw(address(this).balance);
        selfdestruct(payable(msg.sender));
    }
}
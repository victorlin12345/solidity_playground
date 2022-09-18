// SPDX-License-Identifier: GPL-3.0
pragma solidity >0.7.0 < 0.9.0;

contract S {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract T {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

// 給予固定值
contract U is S("s"), T("t") {
}

// 動態值
contract V is S, T {
    constructor(string memory _name, string memory _text)S(_name)T(_text){ 
    }
}

// 混合用：固定值 + 動態值
// constructor execute order 根據 is 後面的順序
// S
// T
// W 
contract W is S("s"), T {
    constructor(string memory _text)T(_text){ 
    }
}
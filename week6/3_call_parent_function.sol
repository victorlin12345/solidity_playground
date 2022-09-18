// SPDX-License-Identifier: GPL-3.0
pragma solidity >0.7.0 < 0.9.0;

/*
calling parent function
- direct
- super

  E
/   \
F   G 
\   /
  H
*/

contract E {
    event Log(string msg);

    function foo() public virtual {
        emit Log("E.foo");
    }

    function bar() public virtual {
        emit Log("E.bar");
    }
}

contract F is E{
    function foo() public virtual override {
        emit Log("F.foo");
        E.foo();
    }

    function bar() public virtual override {
        emit Log("F.bar");
        super.bar();
    }
}

// 只會有 foo G
contract G is E{
    function foo() public virtual override {
        emit Log("G.foo");
    }

    function bar() public virtual override {
        emit Log("G.bar");
        super.bar();
    }
}

// 會先執行後面繼承的 function H, G, F, E
// 和 constructor 不太同
contract H is F, G{
    function foo() public virtual override(G,F) {
        emit Log("H.foo");
        E.foo();
    }

    function bar() public virtual override(F,G) {
        emit Log("H.bar");
        super.bar();
    }
}
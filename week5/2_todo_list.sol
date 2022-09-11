// SPDX-License-Identifier: MIT
pragma solidity >0.7.0 < 0.9.0;

contract TodoList {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string calldata _text) external {
        todos.push(Todo({
            text: _text,
            completed: false
        }));
    }

    // option1: 當 struct 的 field 多時，可先用 storage 存變數，減少 access 的 todos 的次數
    // Todo storage todo = todos[_index]; 
    // todo.text = _text;
    // option2: fields 少時，直接這樣寫比較便宜
    // todos[_index].text = _text;
    // 以下例子測試： option1 -> 34724 gas, option2 -> 34722 gas
    function updateText(uint _index, string calldata _text) external {
        todos[_index].text = _text;
    }
    // storage: 33759
    // memory: 33854
    // 此處用 storage 會直接賦予指標，因此比較便宜
    function get(uint64 _index) external view returns (string memory, bool) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    function toggleCompleted(uint _index) external {
        todos[_index].completed = !todos[_index].completed;
    }
}
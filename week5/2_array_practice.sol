// SPDX-License-Identifier: MIT
pragma solidity >0.7.0 < 0.9.0;

contract ArrayPractice {
    
    uint[] public arr = [1, 2, 3, 4, 5];

    // [1, 2, 3] -- del(1) --> [1, 0, 3]
    function del(uint _index) public {
        require(_index < arr.length, "index out of bound");
        delete arr[_index];
    }

    // [1, 2, 3] -- removeByShift(1) --> [1, 3, 3] --> [1,3]
    function removeByShift(uint _index) public {
        require(_index < arr.length, "index out of bound");
        for (uint i = _index; i < arr.length -1; i ++) {
            arr[i] = arr[i + 1];
        }
        arr.pop();
    }

    // [1, 2, 3, 4] -- removeByReplace(1) --> [1, 4, 3, 4] --> [1, 4, 3] 
    function removeByReplace(uint _index) public {
        require(_index < arr.length, "index out of bound");
        arr[_index] = arr[arr.length - 1];
        arr.pop();
    }

    function delTest() external {
        arr = [1, 2, 3, 4, 5];
        del(0);
        assert(arr[0] == 0);
        assert(arr.length == 5);
    }

    function removeByShiftTest() external {
        arr = [1, 2, 3, 4, 5];
        removeByShift(2); // [1, 2, 4, 5]
        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
        assert(arr.length == 4);
        arr = [1];
        removeByShift(0); // []
        assert(arr.length == 0);
    }

    function removeByReplaceTest() external {
        arr = [1, 2, 3, 4, 5];
        removeByReplace(2); // [1, 2, 5, 4]
        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 5);
        assert(arr[3] == 4);
        assert(arr.length == 4);
        arr = [1];
        removeByReplace(0); // []
        assert(arr.length == 0);
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract_1 {
    // address public implementation;
    uint256 public data;
    uint256 public data2;

    function setData(uint256 _data) public {
        data = _data * 10;
    }

    function multiply(uint256 _a, uint256 _b) public returns (uint256) {
        data2 = _a * _b;
        return data;
    }
}

contract Contract_2 {
    // address public calledAddress;
    uint256 public data;
    uint256 public data2;

    // function setCalledAddress(address _address) public {
    //     calledAddress = _address;
    // }

    function setDelegateAddress(address _address, uint256 val) public {
        (bool success, ) = _address.delegatecall(
            abi.encodeWithSignature("setData(uint256)", val)
        );
        require(success, "Delegate Call failed");
    }

    function setNewDelegate(address _address, uint256 val1, uint256 val2) public {
        (bool success, ) = _address.delegatecall(
            abi.encodeWithSignature("multiply(uint256,uint256)", val1,val2)
        );
        require(success, "Delegate Call failed");
    }
}

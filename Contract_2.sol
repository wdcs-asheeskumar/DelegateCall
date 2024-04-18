// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract_2 {
    address public calledAddress;
    uint256 public data;

    function setCalledAddress(address _address) public {
        calledAddress = _address;
    }

    function setDelegateAddress()public {
        (bool success, ) = calledAddress.delegatecall(abi.encodeWithSignature("setData(uint256)", data));
        require(success, "Delegate Call failed");
    }
}
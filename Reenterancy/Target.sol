// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.20;

contract Targated{
    mapping(address=>uint) public balance;


    function deposit() public payable {
        require(msg.value>0,"Must Greater Than 0 ETH");
        balance[msg.sender] += msg.value;
    }

    function withdraw(uint _amount) public{
        require(balance[msg.sender]>_amount,"Not Enough Balance");
        (bool success,) = payable(msg.sender).call{value:_amount}("");
        require(success,'Transaction Failed');
    }
}
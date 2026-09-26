// SPDX-License-Ientifier: MIT
pragma solidity ^0.8.20;

contract Unchecked{
    mapping(address=>uint) public balance;

    function deposit() public payable {
        require(msg.value>0, "Must Greater Than 0 ETH");
        balance[msg.sender] += msg.value;
    }

    function withdraw() public  {
        require(balance[msg.sender]>0,"Not Enough Money");
        balance[msg.sender] = 0;
        // No External Call Checking Here
        // Imaging The Withdraw Fails, But We Don't have Anything To Check If The Transaction Is Completed Or Failed.
        // Even If It Is Fail, The Balance Of The User Still Be 0, Cuz We Don'w Have Any Checking Here
        (bool success,) = payable(msg.sender).call{value:balance[msg.sender]}("");
    }

    function safeWithdraw() public{
         require(balance[msg.sender]>0,"Not Enough Money");
        balance[msg.sender] = 0;
        (bool success,) = payable(msg.sender).call{value:balance[msg.sender]}("");
        // Here, Checking If The Transaction Completed Only Can Execute The Next require Statement
        // If The require Passes, The Function Completed. If The Transaction Fails, it will not pass the require and whole transaction will be reverted
        require(success,"Transaction Failed");
    }
}
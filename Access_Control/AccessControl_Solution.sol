// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract AccessControlSolution{
    mapping(address=>uint) public balance;
    address immutable owner;

    function deposit() public payable {
        require(msg.value>=0 ether, "Must Greater Than 0 Ether");
        balance[msg.sender] += msg.value;
    }

    // 1st Method Is Check Before Execution The Main Code using require
    function withdrawAll() public {
        require(msg.sender==owner,"Not The Owner");
        (bool success,) = payable(owner).call{value:address(this).balance}("");
        require(success,"Transaction Failed");
    }

    // 2ns Is Include modifier that run before function execution and validate before the function even runs
    modifier onlyOwner(){
        require(msg.sender==owner,"Not The Owner");
        _; // _; means this modifier end and now run the function from where it came
    }
    // The OnlyOwner Here Is Modifier And It Validate Before Running
    function withdrawAgain() public onlyOwner{
        (bool success,) = payable(msg.sender).call{value:address(this).balance}("");
        require(success,"Transaction Failed");
    }

}
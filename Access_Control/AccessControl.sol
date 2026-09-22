// SPDX-License-Ientifier: MIT
pragma solidity ^0.8.30;

contract AccessControlVulnerability{
    mapping(address=>uint) public balance;
    address immutable owner;

    constructor(){
        owner = msg.sender;
    }

    function deposit() public payable{
        require(msg.value>=0 ether, "Must Greater Than 0 Ether");
        balance[msg.sender] += msg.value;
    }
    // This Function WithdrawAll Is VUlnerable. 
    // Any Other User Insted Of Only User Can Access This Function And Execute It.
    function withdrawAll() public {
        require(address(this).balance>=0 ether, "No Funds Here");
        (bool success,) = payable (msg.sender).call{value:address(this).balance}("");
        require(success,"Transaction Failed Dure To UnExpected Error");
    }
}
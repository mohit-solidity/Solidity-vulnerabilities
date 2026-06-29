pragma solidity ^0.8.20;

interface Target{
    function deposit() external payable;
    function withdraw(uint _amount) external;
}

contract Attacker{

}
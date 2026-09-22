// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Multiply{
    uint8 a;
    uint8 b;

    function multiply(uint8 num1, uint8 num2) public pure returns(uint8){
        //This Will Bypass All Check Conditions
        // it give a*b which is outside the range, so it will be mod by 255 ((a*b)  mod 255)and give the result (1)
        unchecked{
            return (num1*num2);
        }
    }

    // Solution :
    function preventMultiplyOutOfScope(uint8 num1, uint8 num2) public pure returns(uint8){
        require(num2<=(255/num1),"Multiplication Overflow");

        unchecked {
            return(num1*num2);
        }
    }
}       
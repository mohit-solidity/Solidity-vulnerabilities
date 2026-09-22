// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TestDivide{

    function uncheckDivide(uint num1, uint num2) public pure returns(uint){
        //Precision Is Lost When We Divide The Number By A Number Biggger Than Quoitent
        unchecked{
            return(num1/num2);
        }
    }

    function correctDivide(uint num1, uint num2) public pure returns(uint){
        // Include Fixed Point
        require(num2!=0, "Divisor Can't Be Zero");
        // The fp is Fixed Point That has a value 1e18(10^18) and whhen we multiply it by num1, it goes to num1*1e18  and when divide by num2, it will not loss precision)
        // Example : num1 = 3, num2  = 30, fp = 1e18(100%)
        // Now Multiply First = num1*1e18 = 3e18(300%)
        // Now Divide By 30 = 3e18/30 = 1e17(10%)
        // This 1e17 represent 10% which means 0.1 in normal value and is decodeed in frontend. SO, insted of getting 0, we are getting 0.1
        uint fp = 1e18;
        unchecked{
            return(num1*fp/num2);
        }
    }
}
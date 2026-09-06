// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract IntegerOverFlow{
    uint8 x = 250;
    uint8 y = 6;
    function prevernt_OverFlow(uint8 num) public returns(uint8){
        require(num<=255 - x,"OverFlow Occured");
        unchecked{
            x += num;
            return x;
        }
    }

    function prevent_UnderFlow(uint8 num) public returns(uint8){
        require(num <= y, "UnderFlow Occured");
        unchecked{
            y -= num;
        }
        return y;
    }
}   
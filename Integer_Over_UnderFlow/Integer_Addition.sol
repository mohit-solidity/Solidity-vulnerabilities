// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract IntegerOverFlow{
    uint8 x = 255;
    uint8 y = 0;
    function overFlow() public returns(uint8){
        unchecked{
            x += 1;
        }
        return x;
    }

    function underFlow() public returns(uint8){
        unchecked{
            y -= 1;
        }
        return y;
    }
}
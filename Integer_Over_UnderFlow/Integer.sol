// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract IntegerOverFlow{
    function bug() public pure returns(uint8){
        // The Range OF X is uint8(0-255). So, it won't go to next number(256), so it will revert
        uint8 x= 255;
        x += 1;
        return x;
    }
}
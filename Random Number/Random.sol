// "SPDX-License-Identifier: UNLICENSED"
pragma solidity ^0.8.0;

contract testtime {
    function stamp() view public  returns(uint256 , uint256, uint256) {
        return (block.timestamp, block.timestamp + 7 days, random());
    }
    
    function random() internal view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp)));
    }
}
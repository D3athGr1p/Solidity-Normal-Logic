pragma solidity ^0.8.0;

contract test {
    uint[] num;
    function addArray() public {
        num.push(1);
    }
    function getHash() internal returns(uint256){
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, num.length)));
    }
    function getRandomNumber() public returns(uint256, uint256) {
        return (num.length, getHash() % num.length);
    }
}
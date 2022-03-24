pragma solidity ^0.8.0;

contract Strings {
    function length(string calldata str) external pure returns(uint) {
        return bytes(str).length;
    }
}
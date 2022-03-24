pragma solidity ^0.8.0;

contract Strings {
    function concatenate(
        string calldata a,
        string calldata b)
        external 
        pure
    returns(string memory) {
        return string(abi.encodePacked(a, b));
    }
}
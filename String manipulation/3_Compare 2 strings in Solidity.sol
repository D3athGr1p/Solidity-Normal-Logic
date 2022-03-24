pragma solidity ^0.8.0;

contract Strings {
    function compare(
    string calldata a,
    string calldata b)
    external
    pure
    returns(bool) {
        return keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked(b));
    }
}
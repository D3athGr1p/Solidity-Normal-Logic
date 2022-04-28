// "SPDX-License-Identifier: UNLICENSED"
pragma solidity ^0.8.0;
contract Verifier {

    function getEthSignedHash(bytes32 _messageHash) private pure returns (bytes32) {
        return keccak256(abi.encodePacked("\x19TRON Signed Message:\n32", _messageHash));
    }

    //return the address according to the signature and and the data
    function validate(uint256 time, uint256 amount, bytes memory signature) public pure returns (address){
    // function validate(bytes memory signature) public returns (bytes memory){
        bytes32 hash = getEthSignedHash(keccak256(abi.encodePacked(time, amount)));
        bytes memory signedString = signature;
        bytes32  r = convertToBytes32(slice(signedString, 0, 32));
        bytes32  s = convertToBytes32(slice(signedString, 32, 32));
        bytes memory v1 = slice(signedString, 64, 1);
        uint8 v;
        if(keccak256(abi.encodePacked(v1)) == keccak256(abi.encodePacked("1b"))) {
            v = 27; 
        } else {
            v = 28;
        }
        return ecrecover(hash, v, r, s);
    }
    //slice function
    function slice(bytes memory data, uint start, uint len) private pure returns (bytes memory){
        bytes memory b = new bytes(len);
        for(uint i = 0; i < len; i++){
            b[i] = data[i + start];
        }
        return b;
    }
    //convert bytes to bytes32
    function convertToBytes32(bytes memory source) private pure returns (bytes32 result) {
        assembly {
            result := mload(add(source, 32))
        }
    }

    function getHash(uint256 time, uint256 amount) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(time, amount));
    }

    function check(uint256 time, uint256 amount) public pure returns(bytes memory) {
        return abi.encodePacked(time, amount);
    }
}

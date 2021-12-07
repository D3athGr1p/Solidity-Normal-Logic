pragma solidity ^0.7;

contract VerifySignature {
    
    
    // use this function to get the hash of any string
    function getHash(string memory str) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(str));
        // below method will use same hash method as above
        // const Web3 = require('web3')
        // val2 = Web3.utils.soliditySha3("hello");
    }
    
    
    // take the keccak256 hashed message from the getHash function above and input into this function
    // this function prefixes the hash above with \x19Ethereum signed message:\n32 + hash
    // and produces a new hash signature
    function getEthSignedHash(bytes32 _messageHash) public pure returns (bytes32) {
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", _messageHash));
    }
    
    
    // input the getEthSignedHash results and the signature hash results
    // the output of this function will be the account number that signed the original message
    function verify(bytes32 _ethSignedMessageHash, bytes memory _signature) public pure returns (address) {
        bytes32 r;
        bytes32 s;
        uint8 v;
        assembly {
          r := mload(add(_signature, 0x20))
          s := mload(add(_signature, 0x40))
          v := byte(0, mload(add(_signature, 0x60)))
        }
        if (v < 27) {
          v += 27;
        }
    
        if (v != 27 && v != 28) {
          return (address(0));
        }
        return ecrecover(_ethSignedMessageHash, v, r, s);
    }
}   
pragma solidity ^0.8.0;

contract ExtractSign {

    function getMultipleSignedAddress(bytes32[] memory _ethSignedMessageHash, bytes[] memory _signature) 
    public view 
    returns(address[] memory)
    {
        address[] memory add;
        require(_ethSignedMessageHash.length == _signature.length);
        for (uint256 i; i < _ethSignedMessageHash.length - 1 ; i++) {
            address a = verify(getEthSignedHash(_ethSignedMessageHash[i]), _signature[i]);
            add[i] = a;
        }
        return add;
    }


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
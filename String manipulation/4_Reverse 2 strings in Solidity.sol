pragma solidity ^0.8.0;

contract Strings {
    function reverse(string calldata _str) external pure returns(string memory) {
        bytes memory str = bytes(_str);
        string memory tmp = new string(str.length);
        bytes memory _reverse = bytes(tmp);

        for(uint i = 0; i < str.length; i++) {
            _reverse[str.length - i - 1] = str[i];
        }
        return string(_reverse);
    }
}
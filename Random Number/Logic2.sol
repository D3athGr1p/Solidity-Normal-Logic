// "SPDX-License-Identifier: UNLICENSED"

pragma solidity ^0.8.0;

contract test {
    uint256[] num;

    function addArray() public {
        num.push(1);
    }

    function getHash() internal view returns (uint256) {
        return
            uint256(
                keccak256(
                    abi.encodePacked(
                        block.difficulty,
                        block.timestamp,
                        num.length
                    )
                )
            );
    }

    function getRandomNumber() public view returns (uint256, uint256) {
        return (num.length, getHash() % num.length);
    }
}

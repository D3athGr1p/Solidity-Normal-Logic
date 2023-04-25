// "SPDX-License-Identifier: UNLICENSED"
pragma solidity 0.8.7;

contract sort {
    function bubbleSort(uint[] memory arr) public pure returns (uint[] memory) {
        uint n = arr.length;
        for (uint i = 0; i < n-1; i++) {
            for (uint j = 0; j < n-i-1; j++) {
                if (arr[j] > arr[j+1]) {
                    uint temp = arr[j];
                    arr[j] = arr[j+1];
                    arr[j+1] = temp;
                }
            }
        }
        return arr;
    }
}
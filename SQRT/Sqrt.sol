// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract SQRT {
   function sqrt(uint x) pure public returns (uint y) {
      uint z = (x + 1) / 2;
      y = x;
      while (z < y) {
         y = z;
         z = (x / z + z) / 2;
      }
   }
}

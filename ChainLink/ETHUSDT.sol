// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0;

interface EACAggregatorProxy {
  function latestAnswer() external view returns (int256);
}

// Get ETH price from Chainlink oracle service
contract PainLink {
    // Kovan, more addresses here: https://docs.chain.link/docs/reference-contracts/
    address public chainLinkETHUSDAddress = 0x9326BFA02ADD2366b30bacB125260Af641031331; 

    function updateEthPrice() public view returns (int256) {
      return EACAggregatorProxy(chainLinkETHUSDAddress).latestAnswer();
    }
}

// ref : https://github.com/jamesbachini/Solidity-By-Example/blob/main/contracts/Oracle.sol
const TronWeb = require('tronweb');


const tronWeb = new TronWeb(
  'https://api.shasta.trongrid.io',
  'https://api.shasta.trongrid.io',
  'https://api.shasta.trongrid.io',
  'Your Private Key',
);

const hex = tronWeb.address.toHex("TCm6YYJVAsUhMunyTvuXkxX8XHoT4MkWJ7")
const withOut41 = "0x" + hex.slice(2);

const convertToCheckSum = Web3.utils.toChecksumAddress(withOut41)

console.log("Solidity Compatable Address : ", convertToCheckSum);

console.log("Tron Address is : ", tronWeb.address.fromHex(hex));

console.log("Manual Convert : ",tronWeb.address.fromHex("41" + "0x1E9Dfedf7EC8C4bBB20A8B8976eAeCd2a776716e".slice(2)))

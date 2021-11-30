https://cryptomarketpool.com/how-to-sign-verify-an-ethereum-message-off-chain/


`sign the message using remix` 

you will get two things : 
- hash
- signature

using `getEthSignedHash` pass `hash` as a argument and you will get `SignedHash`

using `verify` method pass args
- _ethSignedMessageHash = hash
- _signature = signature
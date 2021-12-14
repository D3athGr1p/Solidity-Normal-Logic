- Deploy `Sign.sol` in remix.

- Find hash of the message using `getHash` method or using local sign method
    - EX. 
    ```javascript
    const Web3 = require('web3')
    val2 = Web3.utils.soliditySha3("Hello"); // This method will give same hash as `getHash` method
    ```

- Now open the terminal and clear the console

- set `hash` = `val2` or hash which you got.

- type `account = ethereum.enable().then(console.log)` in console.

- type 
```javascript
sign = await ethereum.request({
    method: 'personal_sign',
    params: [hash, account[0], ''],
  });
```
- You will get the signed message

- In remix in `getEthSignedHash` pass the `hash` and you will get another hash let's say we name this hash as `signedHash`.

- Now in this contract there will be method as `verify`.

- In this method pass first argument `signedHash` and second argument as `sign` and you will get the signer address


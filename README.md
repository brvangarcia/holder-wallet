# Holder Wallet

Smart contract that receives ether or ERC20 and locks it for 5 years, and after period only the owner of the contract can widthdraw the funds.

Contract deployed to: ```0x44a88D23958d50c87a14E6b445bf30d6a4610916```

To deploy this contract use 

```
npx hardhat run scripts/deploy.js --network NETWORK_NAME
```

To verify smart contract use: 

```
npx hardhat verify --network rinkeby CONTRACT_ADDRESS --constructor-args arguments.js 
```
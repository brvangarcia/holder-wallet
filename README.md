# Web3 Boilerplate

This boilerplate is made of Hardhat for smart contract development. The front-end is made of NEXT.JS, Tailwind, and ethers.js

To use this template, follow these steps:

```
clone repo
create .env from .env.example
yarn
yarn dev
```

To verify smart contract use: 

```
npx hardhat verify --network rinkeby CONTRACT_ADDRESS --constructor-args arguments.js 
```
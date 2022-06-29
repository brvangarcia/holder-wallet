const main = async () => {
  const HWallet = await ethers.getContractFactory("HWallet");
  const contract = await HWallet.deploy("0xe94cf435f114327a83b42869Ad8F778B9c4afA65");
  await contract.deployed();
  console.log("Contract deployed to:", contract.address);
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};

runMain();

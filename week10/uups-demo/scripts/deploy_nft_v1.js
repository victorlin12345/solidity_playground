const { ethers, upgrades } = require("hardhat");

/*
Proxy: 0xeb9B9E4B40e337aC5109490B064E1F48fcaFad7C
AppWorksV1: 0xeD4CaC9C15879927EF0eaFf931A8254273Cde981
*/
async function main() {
 const AppWorks = await ethers.getContractFactory("AppWorks");

 console.log("Deploying AppWorks...");

 const appWorks = await upgrades.deployProxy(AppWorks, [], {
   initializer: "initialize",
 });
 await appWorks.deployed();

 console.log("AppWorks deployed to:", appWorks.address);
}

main();
const {
    time,
    loadFixture,
  } = require("@nomicfoundation/hardhat-network-helpers");
  const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
  const { expect } = require("chai");
  const { ethers } = require("hardhat");
  
  describe("AppWorksV2", function () {
    
    describe("NFT contract", async function () {
      it ("Get address", async function () {
        const Token = await ethers.getContractFactory("AppWorksV2");
  
        const hardhatToken = await Token.deploy();
  
        await hardhatToken.deployed()
        console.log(`logic at ${hardhatToken.address}`)
      });
    });
  });
  
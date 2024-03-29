const { ethers, run, network } = require("hardhat");
const { expect, assert } = require("chai");

describe("SimpleStorage", function () {
  let simpleStorageFactory;
  let simpleStorage;

  this.beforeEach(async function () {
    simpleStorageFactory = await ethers.getContractFactory("SimpleStorage");
    simpleStorage = await simpleStorageFactory.deploy();
  });

  it("Should start with a favorite number of 0", async function () {
    const currenValue = await simpleStorage.retrieve();
    assert.equal(currenValue.toString(), "0");
    // Another way
    expect(currenValue.toString()).to.equal("0");
  });

  it("Should update when we call store", async function () {
    const expectedValue = "7";
    const transactionResponse = await simpleStorage.store(expectedValue);
    await transactionResponse.wait(1);

    const currenValue = await simpleStorage.retrieve();
    assert.equal(currenValue.toString(), expectedValue);
  });
});

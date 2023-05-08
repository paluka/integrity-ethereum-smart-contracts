const { deployProxy } = require("@openzeppelin/truffle-upgrades");

const Integrity = artifacts.require("Integrity");

module.exports = async function (deployer) {
  const instance = await deployProxy(Integrity, [], { deployer });
  console.log("Deployed with contract address", instance.address);
};

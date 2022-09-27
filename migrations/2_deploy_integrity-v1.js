const { deployProxy } = require("@openzeppelin/truffle-upgrades");

const Integrity = artifacts.require("Integrity");

module.exports = async function (deployer) {
  // deployer.deploy(Integrity);
  const instance = await deployProxy(Integrity, [], { deployer });
  console.log("Deployed with contract address", instance.address);
};

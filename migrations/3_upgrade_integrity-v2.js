const { upgradeProxy } = require("@openzeppelin/truffle-upgrades");

const Integrity = artifacts.require("Integrity");
const IntegrityV2 = artifacts.require("IntegrityV2");

module.exports = async function (deployer) {
  const existing = await Integrity.deployed();
  const instance = await upgradeProxy(existing.address, IntegrityV2, {
    deployer,
  });
  console.log("Upgraded to v2:", instance.address);
};

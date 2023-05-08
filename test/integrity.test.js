const Integrity = artifacts.require("Integrity");

contract("Integrity", function (/* accounts */) {
  it("should assert true", async function () {
    await Integrity.deployed();
    return assert.isTrue(true);
  });
});

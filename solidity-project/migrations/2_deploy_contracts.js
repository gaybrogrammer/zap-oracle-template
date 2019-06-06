var government = artifacts.require("government_factory");

module.exports = function(deployer) {
  deployer.deploy(government);
};

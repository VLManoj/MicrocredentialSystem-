// migrations/2_deploy_contract.js
const MicroCredentialing = artifacts.require("MicroCredentialing");

module.exports = function(deployer) {
  deployer.deploy(MicroCredentialing);
};

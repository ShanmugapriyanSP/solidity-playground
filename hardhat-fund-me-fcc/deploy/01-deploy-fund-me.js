// function deployFunc() {

//     console.log("HELL")

// }

// module.exports.default = deployFunc()

module.exports = async (hre) => {
  const { getNamedAccounts, deployments } = hre;

  const { deploy, log } = deployments;
  const { deployer } = await getNamedAccounts();
  const chainId = network.config.chainId;
};

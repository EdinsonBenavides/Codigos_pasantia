const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

const demand_power = 1200;

module.exports = buildModule("P2P_register_Module", (m) => {
  const potencia_demandada = m.getParameter("unlockTime", demand_power);
  
  const COntract_P2P_register = m.contract("P2P_register", [potencia_demandada]);

  return { COntract_P2P_register };
});
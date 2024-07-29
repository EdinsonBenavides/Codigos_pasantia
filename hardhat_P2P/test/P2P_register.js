const { expect } = require("chai");
const { ethers } = require("hardhat");

describe('P2P_register Contract', () => {
    it('Should increment the number of agentes', async () => {
        //libreria que nos sirve para interactuar con contratos inteligentes
        const Counter = await ethers.getContractFactory('P2P_register');
        const counter = await Counter.deploy(1200); //deploy llama automaticamente al constructor del contrato
        await counter.register(); //llamdo del metodo incrementar
        const updateCounter = await counter.getNumberAgentes();
        const potencia_demanda = await counter.getPotenciaDemandada();
        expect(updateCounter).to.equal(1)
        expect(potencia_demanda).to.equal(1200)
    });
});
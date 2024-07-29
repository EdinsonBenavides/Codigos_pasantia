// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**

 */
contract P2P_register {

    uint public numberAgentes;
    uint public potenciaDemandada; // P_d
    uint public sumPotencias;

    struct Agente {
        uint potenciaEntregada;
        address identification;
        uint[] dataHistory;
    }

    address public adminAgente;

    mapping(address => Agente) public agentes;

    constructor (uint _potenciaDemandada) {
        adminAgente = msg.sender;
        potenciaDemandada = _potenciaDemandada;        
    }
    
    function register(address _sender) public {
        agentes[msg.sender].identification = _sender;
        numberAgentes ++;
    }

    function getNumberAgentes() public view returns (uint)
    {
        return numberAgentes;
    }
    function getPotenciaDemandada() public view returns (uint)
    {
        return potenciaDemandada;
    }

}
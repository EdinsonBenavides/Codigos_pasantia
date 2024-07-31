// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**

 */
contract OptimizationControl {

    uint public numberAgentes;
    uint public potenciaDemandada; // P_d
    uint public sumPotencias;

    struct Agente {
        uint potenciaEntregada;
        address identification;
        uint[] dataHistory;
    }

    address public adminAgente;

    mapping(address => Agente) private agentes;

    constructor (uint _numberAgentes, uint _potenciaDemandada) {
        adminAgente = msg.sender;
        potenciaDemandada = _potenciaDemandada;
        numberAgentes = _numberAgentes;

        sumatoriaPotencias(adminAgente, potenciaDemandada/numberAgentes);
        agentes[adminAgente].potenciaEntregada = potenciaDemandada/numberAgentes;        
        agentes[adminAgente].dataHistory.push(agentes[adminAgente].potenciaEntregada);
        
    }

    function changeParamtres(
        uint _numberAgentes,
        uint _potenciaDemandada) public
    {
        require(adminAgente == msg.sender);
        potenciaDemandada = _potenciaDemandada;
        numberAgentes = _numberAgentes;

        sumatoriaPotencias(adminAgente, potenciaDemandada/numberAgentes);
        agentes[adminAgente].potenciaEntregada = potenciaDemandada/numberAgentes;        
        agentes[adminAgente].dataHistory.push(agentes[adminAgente].potenciaEntregada);   
    }
    
    function sendData(uint _potencia) public {
        sumatoriaPotencias(msg.sender,_potencia);

        agentes[msg.sender].potenciaEntregada = _potencia;
        agentes[msg.sender].dataHistory.push(_potencia);
    }
    function sumatoriaPotencias(address _sender,uint _potencia ) private {
        sumPotencias = sumPotencias - agentes[_sender].potenciaEntregada + _potencia;
    }

}
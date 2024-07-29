import json
import os
from web3 import Web3, EthereumTesterProvider
from web3.middleware import construct_sign_and_send_raw_middleware



# Note: Never commit your key in your code! Use env variables instead:

w3 = Web3(Web3.HTTPProvider("https://polygon-amoy.g.alchemy.com/v2/WCCpbH7LWuhhVDr3lnri9SisCJqWqSYm"))

account_address = "0x3AF7E73d63dc07e6c6cd6eddD054132ABd943cbD"
private_key = "c5eaf806e3d523a832711a0d96d1a5849019403b123abaf35fc9d6c1f8b77e15"
nonce = w3.eth.get_transaction_count(account_address)

addressContract = "0x6C22c16e9244F85192CE947800E016Ce04B7c8cd"
with open("./artifacts/contracts/P2P_register.sol/P2P_register.json") as file:
    abiContract = json.load(file)["abi"]

contract = w3.eth.contract(address= addressContract, abi=abiContract)

value_demanda = contract.functions.getPotenciaDemandada().call()
number_agentes = contract.functions.getNumberAgentes().call()
print(f'Potencia demandada: {value_demanda}, Numero de agentes: {number_agentes}')

"""
print("Relizando registro...")
###############

# Manually build and sign a transaction:

transaction = contract.functions.register(account_address).build_transaction({
    'chainId': 80002,  # ID de la red (1 para mainnet)
    'gas': 2000000,
    'gasPrice': w3.to_wei('50', 'gwei'),
    'nonce': nonce,
})

# Sign the transaction:
signed_txn = w3.eth.account.sign_transaction(transaction, private_key=private_key)

# Enviar la transacción
tx_hash = w3.eth.send_raw_transaction(signed_txn.rawTransaction)

print(f"Transacción enviada con hash: {w3.to_hex(tx_hash)}")

################
"""

address_admin = contract.functions.adminAgente().call()
print(f"address admin: {address_admin}")
agentes = contract.functions.agentes("0x3AF7E73d63dc07e6c6cd6eddD054132ABd943cbD").call()
print(agentes)

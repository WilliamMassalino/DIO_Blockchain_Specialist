# DIO_Blockchain_Specialist
Repository for projects developed in training: DIO's Blockchain Specialist.
# Creating your first Cryptocurrency on the Ethereum network - DIO Token

## Introduction

This project was developed as part of the "Formação Blockchain Specialist" course on the Digital Innovation One (DIO) platform. It involves creating your first cryptocurrency on the Ethereum network. The project highlights the practical application of concepts such as smart contracts and the Ethereum blockchain. Using tools and technologies like Remix IDE, Ganache, MetaMask, and the Solidity programming language, participants build a foundational understanding of blockchain and cryptocurrency.
The provided Solidity code defines an ERC-20 compliant fungible token contract named `DIOToken`. This contract allows for the creation and management of a cryptocurrency within the Ethereum blockchain. It includes functionalities for issuing tokens, transferring tokens between accounts, approving tokens to be spent by third parties, and querying balance information and token allowances. The contract sets an initial supply of tokens, assigns this supply to the creator of the contract, and ensures compliance with the ERC-20 standard through the implementation of its defined interface, including key functions and events for token operations.

## Table of Contents

- [Introduction](#introduction)
- [Installation](#installation)
- [Usage](#usage)
- [Features](#features)
- [Dependencies](#dependencies)
- [Configuration](#configuration)
- [Documentation](#documentation)
- [Examples](#examples)
- [Troubleshooting](#troubleshooting)


## Installation

Before you can deploy and interact with the DIO Token, you need to set up the following tools:

1. **Remix IDE**: An open-source web application for Ethereum development. Use it to write, compile, and deploy your smart contracts. Access it at [https://remix.ethereum.org](https://remix.ethereum.org).
2. **Ganache**: A personal blockchain for Ethereum development. It allows you to deploy contracts, develop applications, and run tests. Download it from [https://www.trufflesuite.com/ganache](https://www.trufflesuite.com/ganache).
3. **MetaMask**: A browser extension that allows you to interact with the Ethereum blockchain. Install MetaMask from [https://metamask.io](https://metamask.io).

## Usage

To deploy and interact with your DIO Token, follow these steps:

1. **Launch Ganache** to start your local blockchain.
2. **Configure MetaMask** to connect to your Ganache blockchain.
3. **Open Remix IDE** and create a new Solidity file for the DIO Token contract.
4. **Copy and paste** the provided Solidity code into the Remix IDE.
5. **Compile** the smart contract using Remix.
6. **Deploy** the smart contract to your local blockchain via Remix, using MetaMask for the transaction.

## Features

The DIO Token smart contract includes the following features:

- ERC-20 compliance for compatibility with the Ethereum ecosystem.
- A fixed supply of tokens pre-allocated to the creator's address.
- Functions to allow token transfers, delegate approvals, and querying of balances and allowances.

## Dependencies

- **Solidity ^0.8.0**: The smart contract is written in Solidity and requires version 0.8.0 or higher.
- **Remix IDE**: Used for smart contract development.
- **Ganache**: For creating a personal Ethereum blockchain.
- **MetaMask**: For wallet management and blockchain interaction.

## Configuration

No additional configuration is required beyond the initial setup of Remix IDE, Ganache, and MetaMask.

## Documentation

Refer to the following official documentation for more information on the tools and technologies used:

- [Solidity Documentation](https://solidity.readthedocs.io)
- [Remix IDE Documentation](https://remix-ide.readthedocs.io)
- [Ganache Documentation](https://www.trufflesuite.com/docs/ganache/overview)
- [MetaMask Documentation](https://metamask.io/faqs.html)

## Examples

Example of a token transfer:

```solidity
// Transfer 1 DIO Token from the deployer's address to another address
DIOToken.transfer("recipient_address_here", 1 ether);
```

## Troubleshooting

* Ensure Ganache is running and properly connected to MetaMask.
* Verify that the smart contract is compiled without errors before deploying.
* Check MetaMask for transaction prompts and confirmations.

### William Massalino

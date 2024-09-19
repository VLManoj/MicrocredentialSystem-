# micro-credentialing

## Overview
This repository contains a micro-credentialing project utilizing blockchain technology. It includes smart contracts, front-end integration, and related scripts to manage and verify credentials using Ethereum. The setup involves Truffle for smart contract management and Ganache for a local blockchain simulation.

## Prerequisites
Ensure you have the following software installed:
- Node.js (version 12.x or later)
- npm (Node package manager, comes with Node.js)
- Truffle (`npm install -g truffle`)
- Ganache (available at [Ganache](https://www.trufflesuite.com/ganache))

## Project Structure
```bash
micro-credentialing/
├── contracts/           # Solidity smart contracts
│   └── MicroCredentialing.sol
├── migrations/          # Migration scripts for deploying contracts
│   └── 2_deploy_contract.js
├── build/               # Compiled contract artifacts
│   └── contracts/
│       └── MicroCredentialing.json
├── src/                 # Front-end source files
│   ├── index.html
│   └── script.js
├── test/                # Test scripts for contracts
├── truffle-config.js    # Truffle configuration file
└── README.md            # Project documentation

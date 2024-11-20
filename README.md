# Decentralized Document Verification System

A blockchain-based system for securely verifying documents using smart contracts and decentralized storage.

## Overview

This project implements a decentralized approach to document verification, leveraging Ethereum smart contracts and IPFS for secure and immutable data storage. Users are assigned roles (Student, Verifier, Recruiter) to manage and verify documents effectively.

## Features

- **Decentralized Document Upload**: Documents are uploaded to IPFS, ensuring decentralized and secure storage.
- **Verification Process**: Documents are verified by authorized verifiers, ensuring authenticity.
- **Role-Based Access**: Enforces role-specific functionalities:
  - **Students** can upload documents.
  - **Verifiers** validate uploaded documents.
  - **Recruiters** can access verified documents.
- **Event-Driven Architecture**: Key actions trigger Ethereum events, ensuring transparency and traceability.

---

## Project Structure

```plaintext
Decentralized-Document-Verification-System/
├── contracts/
│   └── DocumentVerification.sol        # Smart contract code
├── scripts/
│   └── deploy.py                       # Deployment script using Brownie
├── build/contracts
│   └── DocumentVerification.json       # ABI for interacting with the contract
├── README.md                           # Project overview and setup guide
└── brownie-config.yaml                 
```

---

## Requirements

Ensure the following are installed on your system:
- **Python 3.8+**
- **Brownie**: Ethereum development framework
- **Node.js** (for IPFS and Ethereum tools)
- Ethereum local network or provider (e.g., Ganache or Infura)

---

## Getting Started

### 1. Install Dependencies
```bash
pip install eth-brownie
```

### 2. Deploy the Contract
Navigate to the project directory and run:
```bash
brownie run scripts/deploy.py
```
This script deploys the `DocumentVerification` smart contract and prints its address.

---

## Smart Contract Overview

### DocumentVerification.sol
The smart contract enables:
- Role assignments (`Student`, `Verifier`, `Recruiter`)
- Document upload with an IPFS CID and metadata
- Document verification by authorized verifiers
- Querying document details and verification status

### ABI: DocumentVerification.json
Provides the Application Binary Interface (ABI) to interact with the smart contract using web3 tools.

---

## Future Enhancements

- **Frontend Integration**: A React-based user interface for seamless interactions.
- **Enhanced Security**: Additional cryptographic measures for role verification.
- **Scalability**: Support for Layer-2 solutions to reduce gas fees.

---

## Team

The project is collaboratively developed by:

- **Vijay Krishna Rachamalla**  
- **Mahesh Bodepalli**  
- **Harshitha Puchakayala**  
- **Goje Naveen**

We welcome contributions from the community. See the [Contributing](#contributing) section below for details.

---

## Contributing

1. Fork the repository.
2. Create a new branch: `git checkout -b feature-branch-name`.
3. Make your changes and commit: `git commit -m "Feature description"`.
4. Push to the branch: `git push origin feature-branch-name`.
5. Create a pull request.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

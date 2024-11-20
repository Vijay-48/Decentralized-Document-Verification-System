# scripts/deploy.py
from brownie import DocumentVerification, accounts # type: ignore

def main():
    # Get the account to deploy from (using Brownie's default account setup)
    deployer_account = accounts[0]
    
    # Deploy the contract
    document_verification = DocumentVerification.deploy({"from": deployer_account})
    
    # Print the contract address
    print(f"Contract deployed at: {document_verification.address}")

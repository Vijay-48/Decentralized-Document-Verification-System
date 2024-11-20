// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract DocumentVerification {
    enum Role { None, Student, Verifier, Recruiter }

    struct Document {
        string ipfsCid;
        string issuer;
        uint timestamp;
        bool isVerified;
    }

    mapping(string => Document) public documents;
    mapping(address => Role) public userRoles;
    mapping(address => bool) public verifiers;

    event DocumentUploaded(string indexed ipfsCid, string issuer, uint timestamp);
    event DocumentVerified(string indexed ipfsCid, address verifier, uint timestamp);
    event VerifierAdded(address indexed verifier);
    event VerifierRemoved(address indexed verifier);
    event RoleAssigned(address indexed user, Role role);

    modifier onlyVerifier() {
        require(verifiers[msg.sender], "Only a verifier can call this.");
        _;
    }

    // Assign role to user
    function assignRole(address _user, Role _role) public {
        require(_role != Role.None, "Invalid role.");
        userRoles[_user] = _role;
        emit RoleAssigned(_user, _role);
    }

    // Add a verifier
    function addVerifier(address _verifier) public {
        verifiers[_verifier] = true;
        emit VerifierAdded(_verifier);
    }

    // Remove a verifier
    function removeVerifier(address _verifier) public {
        verifiers[_verifier] = false;
        emit VerifierRemoved(_verifier);
    }

    // Students upload certificates with IPFS CID
    function uploadCertificate(string memory _ipfsCid, string memory _issuer) public {
        require(userRoles[msg.sender] == Role.Student, "Only students can upload certificates.");
        require(documents[_ipfsCid].timestamp == 0, "Document already exists.");
        
        documents[_ipfsCid] = Document(_ipfsCid, _issuer, block.timestamp, false);
        emit DocumentUploaded(_ipfsCid, _issuer, block.timestamp);
    }

    // Verifiers verify certificates
    function verifyCertificate(string memory _ipfsCid) public onlyVerifier {
        require(documents[_ipfsCid].timestamp > 0, "Document does not exist.");
        require(!documents[_ipfsCid].isVerified, "Document already verified.");
        
        documents[_ipfsCid].isVerified = true;
        emit DocumentVerified(_ipfsCid, msg.sender, block.timestamp);
    }

    // Check if a document is verified
    function isDocumentVerified(string memory _ipfsCid) public view returns (bool) {
        return documents[_ipfsCid].isVerified;
    }

    // Retrieve document details including IPFS CID
    function getDocumentDetails(string memory _ipfsCid)
        public
        view
        returns (string memory issuer, uint timestamp, bool isVerified)
    {
        require(documents[_ipfsCid].timestamp > 0, "Document not found.");
        Document memory doc = documents[_ipfsCid];
        return (doc.issuer, doc.timestamp, doc.isVerified);
    }
}

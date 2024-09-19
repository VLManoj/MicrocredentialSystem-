// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MicroCredentialing {
    address public owner;
    
    // Struct to represent a user
    struct User {
        bool isAdmin;
        bool isFaculty;
        bool isStudent;
    }
    
    // Mapping to store user details
    mapping(address => User) public users;
    
    // Mapping to store issued credentials
    mapping(address => bool) public credentials;
    
    // Events for user registration, credential issuance, and revocation
    event UserRegistered(address userAddress, bool isAdmin, bool isFaculty, bool isStudent);
    event CredentialIssued(address userAddress);
    event CredentialRevoked(address userAddress);
    
    // Constructor to set contract owner
    constructor() {
        owner = msg.sender;
    }
    
    // Modifier to restrict access to only the contract owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only contract owner can perform this action");
        _;
    }
    
    // Function to register a new user
    function registerUser(bool _isAdmin, bool _isFaculty, bool _isStudent) public {
        users[msg.sender] = User(_isAdmin, _isFaculty, _isStudent);
        emit UserRegistered(msg.sender, _isAdmin, _isFaculty, _isStudent);
    }
    
    // Function to issue a credential to a user
    function issueCredential(address _userAddress) public onlyOwner {
        require(users[_userAddress].isStudent, "User must be a student to receive a credential");
        credentials[_userAddress] = true;
        emit CredentialIssued(_userAddress);
    }
    
    // Function to verify if a credential is valid
    function verifyCredential(address _userAddress) public view returns (bool) {
        return credentials[_userAddress];
    }
    
    // Function to revoke a credential
    function revokeCredential(address _userAddress) public onlyOwner {
        require(credentials[_userAddress], "Credential must be issued to revoke");
        delete credentials[_userAddress];
        emit CredentialRevoked(_userAddress);
    }
}

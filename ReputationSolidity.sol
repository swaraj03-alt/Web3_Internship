// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReputationSystem {
    // Mapping to store reputation scores
    mapping(address => uint256) public reputation;

    // Owner (admin) of the contract
    address public owner;

    // Events for frontend tracking
    event ReputationUpdated(address indexed user, uint256 newScore, string action);

    // Modifier to restrict access to only owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only contract owner can perform this action");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    // Function to manually assign score (can be automated later)
    function updateReputation(address user, uint256 points, string memory actionType) public onlyOwner {
        reputation[user] += points;
        emit ReputationUpdated(user, reputation[user], actionType);
    }

    // Function to get current score of any wallet
    function getReputation(address user) public view returns (uint256) {
        return reputation[user];
    }
}

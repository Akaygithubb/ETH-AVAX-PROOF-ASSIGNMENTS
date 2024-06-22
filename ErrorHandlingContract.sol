// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleVotingSystem {
    struct Candidate {
        string name;
        uint256 voteCount;
    }

    mapping(address => bool) public hasVoted;
    mapping(uint256 => Candidate) public candidates;
    uint256 public candidateCount;
    address public admin;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only the admin can perform this action");
        _;
    }

    function addCandidate(string memory _name) public onlyAdmin {
        require(bytes(_name).length > 0, "Candidate name cannot be empty");

        candidateCount++;
        candidates[candidateCount] = Candidate(_name, 0);
    }

    function vote(uint256 _candidateId) public {
        require(!hasVoted[msg.sender], "You have already voted");
        require(_candidateId > 0 && _candidateId <= candidateCount, "Invalid candidate ID");

        candidates[_candidateId].voteCount++;
        hasVoted[msg.sender] = true;

        // Using assert to ensure the vote count has increased
        assert(candidates[_candidateId].voteCount > 0);

        // Using revert to prevent votes for a specific candidate (arbitrary condition)
        if (_candidateId == 42) {
            hasVoted[msg.sender] = false;
            candidates[_candidateId].voteCount--;
            revert("Cannot vote for candidate with ID 42");
        }
    }

    function getCandidate(uint256 _candidateId) public view returns (string memory name, uint256 voteCount) {
        require(_candidateId > 0 && _candidateId <= candidateCount, "Invalid candidate ID");

        Candidate memory candidate = candidates[_candidateId];
        return (candidate.name, candidate.voteCount);
    }

    function getTotalCandidates() public view returns (uint256) {
        return candidateCount;
    }

    // Function to reset voting state, callable only by the admin
    function resetVotingState() external onlyAdmin {
        for (uint256 i = 1; i <= candidateCount; i++) {
            hasVoted[msg.sender] = false;
        }
    }
}

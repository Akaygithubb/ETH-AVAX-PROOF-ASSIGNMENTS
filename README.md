Simple Voting System
This repository contains a simple Solidity smart contract that demonstrates the usage of require(), assert(), and revert() statements for error handling in Ethereum smart contracts.

Smart Contract Overview
The SimpleVotingSystem.sol file contains the Solidity code for the smart contract. It includes functions to add candidates, vote for candidates, and retrieve candidate details, demonstrating the use of error handling statements.

Functionality
addCandidate Function:
Usage: Adds a new candidate to the voting system.
Error Handling:
Uses require() to ensure the candidate name is not empty.
vote Function:
Usage: Allows participants to vote for a candidate.
Error Handling:
Uses require() to ensure the voter hasn't voted yet and the candidate ID is valid.
Uses assert() to ensure the vote count has increased.
Uses revert() to prevent votes for candidate ID 42 (arbitrary condition).
getCandidate Function:
Usage: Retrieves the details of a candidate.
Error Handling:
Uses require() to ensure the candidate ID is valid.
getTotalCandidates Function:
Usage: Returns the total number of candidates.
Getting Started
To deploy and interact with the smart contract, follow these steps:

Clone the repository to your local machine:

bash
Copy code
git clone https://github.com/Akaygithubb/simple-voting-system.git
Open the project directory and navigate to the SimpleVotingSystem.sol file.

Deploy the contract using Remix IDE or your preferred Ethereum development environment:

Open Remix IDE.
Create a new file named SimpleVotingSystem.sol.
Copy and paste the code from SimpleVotingSystem.sol into the new file.
Compile and deploy the contract.
Interact with the contract by calling the functions to test error handling scenarios.

Usage
Use Remix IDE or a similar Ethereum development environment to compile and deploy the contract.
Test different input values with the addCandidate, vote, getCandidate, and getTotalCandidates functions to observe error handling behavior.
Explore the contract's code to understand how require(), assert(), and revert() statements are used for error handling.
Contributing
Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

License
This project is licensed under the MIT License - see the LICENSE file for details.


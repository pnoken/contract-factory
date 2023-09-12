// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract VotingFactory {
    address[] public votingContracts;

    event VotingContractCreated(
        address indexed votingContract,
        address indexed creator
    );

    function createVotingContract() public {
        Voting newVoting = new Voting(msg.sender);
        votingContracts.push(address(newVoting));
        emit VotingContractCreated(address(newVoting), msg.sender);
    }

    function getVotingContracts() public view returns (address[] memory) {
        return votingContracts;
    }
}

contract Voting {
    constructor(address _owner) {
        owner = _owner;
    }
}

// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract OwnerVault {
    
    address public owner;
    bool private isPaused;

    event Deposited(address indexed sender, uint256 amount);
    event Withdrawn(address indexed to, uint256 amount);
    event Paused(address indexed by, bool isPaused);

    constructor() {
        owner = msg.sender;
    }

    function deposit() external payable {
        require(msg.sender == owner, "Not authorized");
        require(!isPaused, "Contract is paused");
        require(msg.value >= 0.0001 ether, "Amount is too low");

        emit Deposited(msg.sender, msg.value);
    }

    function withdraw(uint256 _amount) external {
        require(msg.sender == owner, "Not authorized to withdraw");
        require(!isPaused, "Contract is paused");
        require(_amount >= 0.0001 ether, "Insufficient amount");

        (bool sent, ) = owner.call{value: _amount}("");
        require(sent, "Failed to transfer");

        emit Withdrawn(owner, _amount);
    }

    function pauseContract() external {
        require(msg.sender == owner, "Only owner can pause");
        isPaused = true;
        emit Paused(owner, isPaused);
    }

    function unpauseContract() external {
        require(msg.sender == owner, "Only owner can unpause");
        isPaused = false;
        emit Paused(owner, isPaused);
    }

    function isContractPaused() external view returns (bool) {
        return isPaused;
    }
}

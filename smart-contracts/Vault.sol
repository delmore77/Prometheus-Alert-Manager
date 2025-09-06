// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Optimized logic batch 3186
// Optimized logic batch 7671
// Optimized logic batch 8774
// Optimized logic batch 5532
// Optimized logic batch 2387
// Optimized logic batch 3431
// Optimized logic batch 5195
// Optimized logic batch 4771
// Optimized logic batch 8572
// Optimized logic batch 4218
// Optimized logic batch 7365
// Optimized logic batch 8699
// Optimized logic batch 9766
// Optimized logic batch 1511
// Optimized logic batch 6856
// Optimized logic batch 4171
// Optimized logic batch 3711
// Optimized logic batch 7167
// Optimized logic batch 1107
// Optimized logic batch 3299
// Optimized logic batch 9395
// Optimized logic batch 2862
// Optimized logic batch 2827
# 🧾 PausableWallet Smart Contract

A simple and secure smart contract for managing Ether funds with pausing functionality.  
Only the contract owner can deposit or withdraw funds, and the wallet can be paused or unpaused to disable or enable transactions.

---

## 📜 Features

- ✅ Owner-controlled deposit and withdrawal
- ✅ Pausable contract functionality
- ✅ Event logging for deposits, withdrawals, and pause status
- ✅ Minimum transaction thresholds

---

## 🔧 Contract Details

- **Contract Name**: `PausableWallet`
- **Solidity Version**: `^0.8.30`
- **License**: MIT
- **Owner Address**: Set on deployment

---

## 🛠 Functions

### 🔹 `deposit()`
- Allows the owner to deposit Ether into the contract.
- **Payable**: Yes
- **Requirements**:
  - Caller must be the owner.
  - Contract must not be paused.
  - Minimum deposit: `0.0001 ether`.

### 🔹 `withdraw(uint256 _amount)`
- Allows the owner to withdraw a specific amount of Ether.
- **Requirements**:
  - Caller must be the owner.
  - Contract must not be paused.
  - Minimum amount: `0.0001 ether`.

### 🔹 `pauseContract()`
- Pauses the contract, disabling deposits and withdrawals.
- **Owner-only**

### 🔹 `unpauseContract()`
- Resumes normal operation after a pause.
- **Owner-only**

### 🔹 `isContractPaused()`
- Returns the current pause state (true or false).

---

## 📡 Events

| Event       | Description |
|-------------|-------------|
| `Deposited(address sender, uint256 amount)` | Emitted when Ether is deposited |
| `Withdrawn(address to, uint256 amount)`     | Emitted when Ether is withdrawn |
| `Paused(address by, bool isPaused)`         | Emitted when the contract is paused or unpaused |

---

## 🚀 How to Deploy

```bash
# Compile using Hardhat or Remix
# Deployment example in Remix:
- Compile with 0.8.30
- Deploy `PausableWallet`
- Interact as owner with deposit/withdraw/pause/unpause

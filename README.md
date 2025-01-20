# Multisigwallet-smart-contract

This smart contract is a simple implementation of a multi-signature wallet. It allows multiple owners to collectively approve and execute transactions. 
---

## Features
- **Multiple Owners:** The wallet is managed by multiple addresses.
- **Approval Mechanism:** Transactions require a specific number of confirmations from the owners before being executed.
- **Secure Transaction Execution:** Ensures only approved transactions are executed.

---

## Contract Structure
1. **Owners:** An array of wallet owner addresses.
2. **Required Confirmations:** The minimum number of approvals needed to execute a transaction.
3. **Transactions:** A list of submitted transactions containing:
   - `to`: Address to send funds to.
   - `value`: Amount of Ether to transfer.
   - `confirmations`: Number of approvals received.
   - `executed`: Whether the transaction has been executed.
4. **Mappings:**
   - `hasConfirmed`: Tracks which owners have approved a specific transaction.

---

## Functions
### 1. `constructor(address[] memory _owners, uint _requiredConfirmations)`
- Initializes the wallet with the given owner addresses and the required number of confirmations.
- **Arguments:**
  - `_owners`: Array of wallet owner addresses.
  - `_requiredConfirmations`: Minimum approvals needed for transaction execution.

### 2. `submitTransaction(address _to, uint _value)`
- Submits a new transaction for approval.
- **Arguments:**
  - `_to`: Address to transfer Ether to.
  - `_value`: Amount of Ether to transfer.

### 3. `confirmTransaction(uint _txId)`
- Allows an owner to approve a specific transaction.
- **Arguments:**
  - `_txId`: The transaction ID to confirm.

### 4. `executeTransaction(uint _txId)`
- Executes a transaction if the required number of approvals has been met.
- **Arguments:**
  - `_txId`: The transaction ID to execute.

### 5. `receive()`
- A fallback function to accept Ether deposits into the contract.

---

## Deployment and Testing
1. **Deployment:**
   - Owners: `["0x123...", "0x456..."]`
   - Confirmations: `2`

2. **Submit Transaction:**
   - `_to`: `0x789...`
   - `_value`: `1 Ether`

3. **Confirm Transaction:**
   - Owner 1 calls `confirmTransaction(0)`.
   - Owner 2 calls `confirmTransaction(0)`.

4. **Execute Transaction:**
   - Call `executeTransaction(0)`.

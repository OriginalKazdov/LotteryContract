# 🎰 Lottery Contract (Solidity)

This is a simple lottery smart contract written in Solidity.  
It allows users to participate by sending a fixed amount of ETH, and the **owner** (the account that deploys the contract) can select a pseudo-random winner who receives the entire accumulated balance.

> ⚠️ **Important:**  
> This contract is for **educational purposes only.**  
> The randomness method used here is **NOT secure for production** and can be manipulated by validators/miners.

---

## 🧱 Key Features

- The contract has an **owner** (the account that deploys it).
- Users can enter the lottery by sending exactly `0.1 ETH`.
- Each valid entry adds the player's address to the `players` array.
  - If someone enters multiple times, their address will appear multiple times, increasing their chances of winning.
- Only the **owner** can:
  - check the contract balance using `getBalance()`
  - execute `pickWinner()` to select a winner
- Once a winner is picked:
  - one address is chosen pseudo-randomly from the `players` array
  - the entire contract balance is transferred to the winner
  - the list of players is reset for the next lottery round

---

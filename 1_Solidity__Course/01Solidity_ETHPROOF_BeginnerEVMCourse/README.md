# Getting Started with Solidity

## Project: Create a Token

In this project, we will create a token contract together. This exercise is designed to give us hands-on experience with Solidity, the programming language used for creating smart contracts.

## Purpose and Functionality

This project aims to provide a practical introduction to Solidity programming by creating a token contract. The contract includes features like minting and burning tokens, allowing users to interact with the blockchain.

## Requirements

To successfully complete this project, our contract should meet the following requirements:

1. **Public Variables**:
   - `token_Name`: The name of our token.
   - `token_Abbrv`: The abbreviation or symbol for our token.
   - `total_Supply`: The total supply of our token.

2. **Mapping of Balances**:
   - `balances`: A mapping of addresses to token balances.

3. **Mint Function**:
   - `mint(address recipient_address, uint tokenAmount)`: This function increases the total supply by the specified number and increases the balance at the recipient address by that amount.

4. **Burn Function**:
   - `burn(address Owner_address, uint burnTokens)`: This function decreases the total supply and the balance at the owner address by the specified number of tokens.

   Note: The function should include conditionals to ensure the balance of the account is greater than or equal to the amount to be burned.


## Example Code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract MyToken {

    // public variables here
    string public token_Name = "HSR_PSR";
    string public token_Abbrv = "HSPS";
    uint public total_Supply = 0;

    // mapping variable here
    mapping(address => uint) public balances;

    // mint function
    function mint(address recipient_address, uint tokenAmount) public {
        total_Supply += tokenAmount;
        balances[recipient_address] += tokenAmount;
    }

    // burn function
    function burn(address Owner_address, uint burnTokens) public {
        if(balances[Owner_address] >= burnTokens) {
            total_Supply -= burnTokens;
            balances[Owner_address] -= burnTokens;
        }
    }

}


```

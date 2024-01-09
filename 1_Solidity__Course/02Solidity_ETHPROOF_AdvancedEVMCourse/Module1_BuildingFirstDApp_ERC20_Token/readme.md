

# TokenVesting DApp by Me(Hemant Singh)

## Overview

TokenVesting is a decentralized application (DApp) designed to streamline token vesting for organizations. This empowers them to create and manage customized vesting schedules for various stakeholders. Whitelisted users can effortlessly claim their vested tokens once the predefined vesting period elapses.

## Contract Specifications

📜 **License:** MIT  
📌 **Solidity Version:** 0.8

## Contract Architecture

1. **Vesting Contract:** The core contract managing the intricacies of the vesting process.
2. **Token Contract:** An external contract symbolizing the token subject to vesting, seamlessly integrated into the main `Vesting` contract.

## Key Features

1. **Organization Registration (`register()`):** Organizations effortlessly register by furnishing vital details like token specifics, vesting parameters, white-listed stakeholders, and vested amounts. Organizational details, coupled with a reference to the corresponding `Token` contract, are securely stored.

2. **Token Withdrawal (`withdrawTokens()`):** Whitelisted users enjoy a straightforward process to withdraw their vested tokens post the vesting period. The contract ensures airtight validation of withdrawal conditions before initiating the transfer.

3. **Organizational Verification (`isOrg()`):** Users can conveniently verify if a given address corresponds to a registered organization.

4. **Get Organization Details (`getOrgDetails()`):** Users gain access to comprehensive details about a registered organization—covering token specifics, stakeholders, vesting timeline, and withdrawal status.

## Getting Started

1. Deploy the `Vesting` contract while specifying the `Token` contract address.
2. Utilize the `register` function to seamlessly onboard organizations, defining their unique details.
3. Whitelisted users can execute `withdrawTokens` to claim their vested tokens post the vesting period.
4. Leverage the provided getter functions for real-time access to organizational and vesting specifics.

## Appreciation

Thank you for exploring the TokenVesting DApp by Me(Hemant Singh). My journey in decentralized token management begins here! 🚀
```

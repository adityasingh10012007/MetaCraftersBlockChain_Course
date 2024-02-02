




# DeFi coverage provider Protocol - README

## overview

Welcome to the DeFi insurance provider Protocol! This mission transforms decentralized finance (DeFi) by introducing crypto wallet insurance and crypto-sponsored credit score protection. customers can make monthly payments, get right of entry to DeFi sources, and enjoy streamlined fee and claims processing through user-pleasant contracts.




## Contracts   ==>




### 1. InsuranceFactory.sol

This settlement works like a multi-aspect manufacturing unit, allowing users to create and manage a couple of insurance contracts. Their duties consist of the initiation of the insurance e book and the mortgage settlement, in addition to the renewal of information for coverage price range and facilitating their implementation.
Use this contract to correctly create and control more than one insurance contracts.


#### Functions:

- `createNewWalletInsurance`: Create a new wallet insurance contract.
- `renewExistingWalletInsurance`: Renew an existing wallet insurance contract.
- `claimWalletInsurancePolicy`: Start the claim process for wallet insurance.
- `createNewCollateralInsurance`: Create a new collateral insurance contract.
- `claimCollateralInsurance`: Start a collateral insurance claim.
- `getUserInsuranceContracts`: Returns the addresses of the user's wallet and collateral insurance contracts.










### 2. WalletInsurance.sol

mainly for wallet coverage, this agreement makes things smooth—handling payments, submitting claims, and giving clean insurance info. It guarantees a smooth enjoy for customers, simplifying insurance control.


#### Functions:

- `payMonthlyPremium`: Allows the policyholder to easily pay monthly insurance costs.
- `claimInsurance`: Initiates the insurance claim process.
- `getDetails`: Retrieves detailed information about the insurance contract.









### 3. CollateInsurance.sol

This agreement is pinnacle-notch for bank coverage, supplying masses of cash for rates, managing coverage smoothly with collateral, and giving targeted info on loan coverage. particularly crafted for bank coverage, it ensures maximum financial aid for premiums and gives a complete solution within the insurance settlement world.


#### Functions:

- `payPremium`: Facilitates the payment of insurance premiums on insurance products.
- `claimCollateralInsurance`: Initiates the process of requesting insurance coverage based on the value of the insured item.
- `getDetails`: Retrieves detailed information about the insurance contract.










## contributors

- [Hemant Singh ](https://github.com/adityasingh10012007)

## License

This project is licensed below the [MIT License](LICENSE).































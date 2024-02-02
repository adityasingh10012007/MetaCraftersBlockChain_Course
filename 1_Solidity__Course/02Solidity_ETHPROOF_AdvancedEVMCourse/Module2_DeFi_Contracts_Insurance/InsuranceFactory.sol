




// SPDX-License-Identifier:MIT



pragma solidity ^0.8;
import "./WalletInsurance.sol";
import "./CollateralInsurance.sol";

// Smart contract for managing insurance contracts

// InsuranceFactory contract
contract InsuranceFactory {

    // Mapping of the user address to the wallet insurence contract
    mapping(address => address) public userWalletInsuranceContracts;

    // Mapping of the user address to the collateral insurence contract
    mapping(address => address) public userCollateralInsuranceContracts;


    // With the help of this Function  user can a new wallet insurance contract
    function createNewWalletInsurance(
        address ownerAddress,  // this is user's address for the new wallet insurance
        uint256 premiumAmount, // the amount which user will apy as premium
        uint256 insurancePayout, // it is Insurance payout amount
        uint256 coverageDuration // Coverage Duration for  insurance 
    ) public returns (address) {  //  it will return the wallet insurance address but 
        // Check if an walltel insurance contract already exists for the user or nor
        require(
            userWalletInsuranceContracts[ownerAddress] == address(0),
            "Insurance already exists, to renew use renewWallet()"
        );
        // Qtherwise Create a new instance of WalletInsurance contract
        WalletInsurance newWalletIns = new WalletInsurance(
            ownerAddress,
            premiumAmount,
            coverageDuration,
            insurancePayout
        );
        // Store the new contract address in the mapping
        userWalletInsuranceContracts[ownerAddress] = address(newWalletIns);
        return (address(newWalletIns));
    }

    // this Function is to renew an existing wallet insurance contract of the existing user
    function renewExistingWalletInsurance(
        uint256 premiumAmount,  // the amount which user will apy as premium for the renewed insurance contract
        uint256 coverageDuration,  // Coverage Duration for  renewed insurance contract 
        uint256 insurancePayout  // Insurance payout amount
    ) public returns (address) {
        // Create a new instance of WalletInsurance contract for renewal
        WalletInsurance renewedWalletIns = new WalletInsurance(
            msg.sender,
            premiumAmount,
            coverageDuration,
            insurancePayout
        );
        // Update the contract address in the mapping
        userWalletInsuranceContracts[msg.sender] = address(renewedWalletIns);
        return (address(renewedWalletIns));
    }

    // using this user can  claim a wallet insurance policy
    function claimWalletInsurancePolicy() public returns (bool) {
        // fetch the contract address for the user which was assigned to user
        address walletInsAddress = userWalletInsuranceContracts[msg.sender];
        require(walletInsAddress != address(0), "No insurance created.");
        // Cast the contract address to WalletInsurance type
        WalletInsurance walletIns = WalletInsurance(walletInsAddress);
        // Initiate the insurance claim
        uint256 payoutAmount = walletIns.claimInsurance();
        // before it will  Check if the contract has sufficient funds or not
        require(address(this).balance >= payoutAmount, "Insufficient funds.");
        // otherwise Transfer the payout amount to the user address
        payable(msg.sender).transfer(payoutAmount);
        return true;
    }

    // Function to create a new collateral insurance contract
    function createNewCollateralInsurance(
        address ownerAddress,   // this is user's address for the new collateral insurance
        uint256 premiumAmount,  // the amount which user will apy as premium for insurance contract
        uint256 loanAmount,   // Loan amount covered by the insurance
        uint256 collateralValue,  // Value of the collateral provided
        uint256 insurancePercentage,   // Percentage of insurance coverage on collateral
        uint256 collateralThreshold  // this is the threshold value for collateral to  claim the  insurance 
    ) public returns (address) {
        // it will Check if a collateral insurance contract already exists for the user 
        address collateralInsAddress = userCollateralInsuranceContracts[msg.sender];
        require(collateralInsAddress == address(0), "Insurance already created.");
        // Create a new instance of CollateralInsurance contract
        CollateralInsurance newCollateralIns = new CollateralInsurance(
            ownerAddress,
            premiumAmount,
            loanAmount,
            collateralValue,
            insurancePercentage,
            collateralThreshold
        );
        // Store the new contract address in the mapping
        userCollateralInsuranceContracts[ownerAddress] = address(newCollateralIns);
        return (address(newCollateralIns));
    }

    // Function to claim a collateral insurance policy
    function claimCollateralInsurance(uint256 collateralValue) public returns (bool) {
        // fetch  the contract address for the user to the clain
        address collateralInsAddress = userCollateralInsuranceContracts[msg.sender];
        require(collateralInsAddress != address(0), "No insurance created.");
        // Cast the contract address to CollateralInsurance type
        CollateralInsurance collateralIns = CollateralInsurance(collateralInsAddress);
        // Initiate the collateral insurance claim
        uint256 payoutAmount = collateralIns.claimCollateralInsurance(collateralValue);
        // Check if the contract has sufficient funds
        require(address(this).balance >= payoutAmount, "Insufficient funds.");
        // Transfer the payout amount to the user
        payable(msg.sender).transfer(payoutAmount);
        return true;
    }

    // the below Function to retrieve user's insurance contracts
    function getUserInsuranceContracts() public view returns (address, address) {
        return (
            userCollateralInsuranceContracts[msg.sender],
            userWalletInsuranceContracts[msg.sender]
        );
    }

    // Function to fund the contract account
    function fundAccount() public payable returns (uint256) {
        return (address(this).balance);
    }
}












































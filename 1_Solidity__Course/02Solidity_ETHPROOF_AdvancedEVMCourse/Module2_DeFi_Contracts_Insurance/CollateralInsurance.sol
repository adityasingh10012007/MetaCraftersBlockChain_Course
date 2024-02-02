




// SPDX-License-Identifier: MIT



pragma solidity ^0.8;

// Smart contract defining a collateral insurance

// CollateralInsurance contract
contract CollateralInsurance {
    address public loanRecipient;  // Address of the user or loan recipient
    uint256 public premiumAmt;   // Premium amount for the insurance which user paid
    uint256 public collatValue; // Current collateral value
    uint256 public insurancePercentage; // Percentage of insurance coverage on collateral
    bool public isClaimed;  // check insurance has claimed or nor
    uint256 public collatThreshold;  // Threshold value for collateral 
    uint256 public loanAmount;  // Loan amount of user which covered by the insurance
    // this function will restrict access to only the use or loan recipient
    modifier onlyLoanRecipient() {
        require(msg.sender == loanRecipient, "Only loan recipient can call");
        _;
    }

    // Constructor to initialize the collateral insurance contract
    constructor(
        address _loanRecipient,  // Address of the loan recipient
        uint256 _premiumAmt,  // Premium amount for the insurance which user paid
        uint256 _loanAmount,   // Loan amount of user which covered by the insurance
        uint256 _collatValue,  // Current collateral value
        uint256 _insurancePercentage,  // Percentage of insurance coverage on collateral
        uint256 _collatThreshold  // Threshold value for collateral triggering insurance claim
    ) payable {
        loanRecipient = _loanRecipient;
        premiumAmt = _premiumAmt;
        collatValue = _collatValue;
        insurancePercentage = _insurancePercentage;
        loanAmount = _loanAmount;
        collatThreshold = _collatThreshold;
    }

    // with the help of this Function  loan recipient can pay the premium amount
    function payPremium() external payable onlyLoanRecipient {
        require(msg.value >= premiumAmt, "Insufficient premium amount");
        loanAmount -= msg.value;
    }

    // this Function to claim collateral insurance if the collateral value goes below the threshold
    function claimCollateralInsurance(uint256 currentCollatValue)
        external
        onlyLoanRecipient
        returns (uint256)
    {
        require(!isClaimed, "Already claimed.");
        require(
            currentCollatValue < collatThreshold,
            "Collateral value is above threshold"
        );
        isClaimed = true;
        return ((insurancePercentage * collatValue) / 100);
    }

    // Function to retrieve details of the collateral insurance
    function getDetails()
        external
        view
        returns (
            address,
            uint256,
            uint256,
            uint256,
            bool,
            uint256,
            uint256
        )
    {
        return (
            loanRecipient,
            premiumAmt,
            collatValue,
            insurancePercentage,
            isClaimed,
            collatThreshold,
            loanAmount
        );
    }
}















































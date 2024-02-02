




// SPDX-License-Identifier:MIT



pragma solidity ^0.8;

// Smart contract defining a simple insurance wallet

// Contract for WalletInsurance
contract WalletInsurance {
    address public policyHolder;   // Address of the user or policy holder
    mapping(uint256 => bool) internal premiumPaid;  // Mapping to track whether premiums for each month are paid
    uint256[] premiumPaidTimestamps;  // Array to store timestamps of premium payments when premiums are paid
    uint256 internal premiumAmount; // Premium amount to be paid monthly y the policyholder or the user
    uint256 internal insurancePeriod; // Duration of the insurance coverage for the insurance
    uint256 internal insurancePayout;  // Amount to be paid in case of an insurance claim
    bool internal isClaimed;      // check insurance is claimed or nor
    // Constructor to initialize the insurance contract
    constructor(
        address _policyHolder,  // Address of the user or policy holder
        uint256 _premiumAmount,    // Premium amount to be paid monthly
        uint256 _insurancePeriod,    // Duration of the insurance coverage
        uint256 _insurancePayout   // Amount to be paid in case of an insurance claim
    ) {
        policyHolder = _policyHolder;
        premiumAmount = _premiumAmount;
        insurancePayout = _insurancePayout;
        insurancePeriod = block.timestamp + _insurancePeriod;
    }

    // Modifier to restrict access to only the policy holder
    modifier onlyPolicyHolder() {
        require(msg.sender == policyHolder, "Only policy holder can call");
        _;
    }

    // Function for the policy holder to pay the monthly premium
    function payMonthlyPremium() public payable onlyPolicyHolder returns (bool) {
        require(
            insurancePeriod >= block.timestamp,
            "Insurance expired, please renew."
        );
        require(msg.value >= premiumAmount, "Insufficient premium amount.");

        // Check if the monthly premium was paid in the last month or not if no then .
        if (premiumPaidTimestamps.length > 0) {
            require(
                lastMonthPremiumPaid() == true,
                "Last month premium not paid."
            );
        }

        uint256 currentTimestamp = block.timestamp;
        premiumPaid[currentTimestamp] = true;
        premiumPaidTimestamps.push(currentTimestamp);

        return true;
    }

    // Function to initiate an insurance claim
    function claimInsurance() public returns (uint256) {
        // //  it will check is insurance has claimed or not
        require(isClaimed == false, "Already claimed.");

        // Some checks for the wallet being hacked.
        require(
            insurancePeriod >= block.timestamp,
            "Insurance expired, please renew."
        );
        require(initialPremiumPaid() == true, "Initial premium not paid.");

        // Check if the monthly premium was paid in the last month.
        require(lastMonthPremiumPaid() == true, "Last month premium not paid.");

        isClaimed = true;
        return insurancePayout;
    }

    // Function to retrieve insurance details for the policy holder
    function getInsuranceDetails()
        public
        view
        onlyPolicyHolder
        returns (
            uint256,
            uint256,
            uint256,
            bool
        )
    {
        if (premiumPaidTimestamps.length > 0) {
            uint256 lastPremiumPaidTimestamp = premiumPaidTimestamps[
                premiumPaidTimestamps.length - 1
            ];
            return (
                premiumAmount,
                insurancePayout,
                insurancePeriod,
                premiumPaid[lastPremiumPaidTimestamp]
            );
        } else {
            return (premiumAmount, insurancePayout, insurancePeriod, false);
        }
    }

    // Function to check if the initial premium was paid
    function initialPremiumPaid() public view returns (bool) {
        if (premiumPaidTimestamps.length == 0) {
            return false;
        } else {
            uint256 lastPremiumPaidTimestamp = premiumPaidTimestamps[
                premiumPaidTimestamps.length - 1
            ];
            if (premiumPaid[lastPremiumPaidTimestamp] == true) {
                return true;
            }
        }
        return false;
    }

    // Function to check if the last month's premium was paid
    function lastMonthPremiumPaid() public view returns (bool) {
        if (initialPremiumPaid() == true) {
            uint256 lastPremiumPaidTimestamp = premiumPaidTimestamps[
                premiumPaidTimestamps.length - 1
            ];
            if (lastPremiumPaidTimestamp >= (block.timestamp - 4 weeks)) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }
}














































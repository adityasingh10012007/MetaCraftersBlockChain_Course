

// SPDX-License-Identifier: MIT



pragma solidity ^0.8.18;

contract StorageVictim {

    address public owner;
   
    struct Storage {
        address user;
        uint256 amount;
    }

    mapping(address => Storage) storages;

    constructor() {
        owner = msg.sender;
    }

    
    function store(uint256 amount_) public {

       Storage memory str = Storage({user: msg.sender, amount: amount_});
       storages[msg.sender] = str;
    }

    
    function getStore() public view returns (address, uint256) {
        
        Storage memory str = storages[msg.sender];
        return (str.user, str.amount);
    }

    function getOwner() public view returns (address) {
        return owner;
    }

    
}

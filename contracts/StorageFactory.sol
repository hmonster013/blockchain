// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract StorageFactory is SimpleStorage{
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorage() public returns (uint256) {
        // Create instance of contract and add to array. 
        // Note: Can't just do simpleStorageArray.push(simpleStorageInstance); since that would require the address to be stored
        SimpleStorage simpleStorageInstance = new SimpleStorage();
        uint256 indexOfStorageInstanceInArray = simpleStorageArray.length;
        simpleStorageArray.push(simpleStorageInstance);
        
        // Return the index of the newly created instance in the array
        return indexOfStorageInstanceInArray;
    }

    function sfStore(uint256 _index, uint256 _favoriteNumber) public {
        SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_index]));
        simpleStorage.store(_favoriteNumber);
    }

    function sfGet(uint256 _index) public view returns (uint256) {
        return SimpleStorage(address(simpleStorageArray[_index])).retrieve();
    }
}
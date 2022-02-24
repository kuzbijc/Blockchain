// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0;

// contract still deployable in this contract
import "./SimpleStorage.sol";

// all functions from SimpleStorage are inherited!
contract StorageFactory is SimpleStorage {

    // used to store our simple storage contracts
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    // storing favoriteNumber into specific contracts
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // Address
        // ABI
        SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).store(_simpleStorageNumber); 
    }

    // viewing favoriteNumber that was stored to specific contract
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).retrieve();
    }
}

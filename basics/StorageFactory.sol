// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import './SimpleStorage.sol';

contract StorageFactory {

    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorage() public {
        simpleStorageArray.push(new SimpleStorage());
    }

    function sfStore(uint _simpleStorageIndex, uint _simpleStorageNumber) public {
        simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
    }

    function sfGet(uint _simpleStorageIndex) public view returns (uint) {
        return simpleStorageArray[_simpleStorageIndex].retrieve();
    }
}

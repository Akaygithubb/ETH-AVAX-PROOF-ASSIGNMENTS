// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorHandlingContract {
    uint256 public value;

    function setValue(uint256 _newValue) public {
        // Using require() for input validation
        require(_newValue > 0, "Input value must be greater than zero");

        // Using assert() for internal state validation
        uint256 newValue = value + _newValue;
        assert(newValue > value);

        // Using revert() to revert the transaction
        if (_newValue == 42) {
            revert("Cannot set value to 42");
        }

        // Update the value if all conditions pass
        value = newValue;
    }
}

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract LockUSDT {
    address private usdtAddress;
    mapping (address => amount) pendingBalance;

    constructor(address _usdtAddress) {
        usdtAddress = _usdtAddress;
    }

    function deposit(uint256 _amount) public {
        require(IERC20(usdtAddress).allowance(msg.sender, address(this)) >= _amount);

        IERC20(usdtAddress).transferFrom(msg.sender, address(this), _amount);
        pendingBalance[msg.sender] += amount;
    }

    function withdraw() public {
        IERC20(usdtAddress).transfer(msg.sender, pendingBalance[msg.sender]);
        pendingBalance[msg.sender] = 0;
    }
}

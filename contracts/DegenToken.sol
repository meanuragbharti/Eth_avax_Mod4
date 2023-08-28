// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {

    constructor() ERC20("Degen", "DGN") {}

    // Mint new tokens
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Redeem tokens for in-game items
    function redeem(uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "Not enough tokens");
        _burn(msg.sender, amount);
        // Perform in-game item redemption logic here
    }

    // Transfer tokens to others
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    // Burn tokens that are no longer needed
    function burn(uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "Not enough tokens");
        _burn(msg.sender, amount);
    }
}

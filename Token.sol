// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {

    uint public count;
    address caller;
    constructor(uint256 _amount) ERC20("MyToken", "MTK") {
        mint(msg.sender, _amount);
        mint(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2, 10);
        mint(0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db, 10);
        mint(0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB, 10);
        mint(0x617F2E2fD72FD9D5503197092aC168c91465E7f2, 10); 
        //["0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2","0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db"];
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount /* * 10 ** 18 */);
    }

    modifier callerOnly(){
        require(msg.sender == owner() || msg.sender == caller,"not authorised");
        _;
    }

    function setCallerContract(address _caller) external onlyOwner{
        caller = _caller;
    }

    function tokens() public callerOnly{
        count += 1;
    }

}
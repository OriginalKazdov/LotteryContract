//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery{
  address public owner;
  address[] public players;
  uint256 amount = 0.1 ether;

  modifier OnlyOwner(){
    require(owner == msg.sender, "Not an owner");
    _;
  }

  constructor() {
    owner = msg.sender;
  }

  function enter() external payable{
    require(msg.value == amount, "Can't exceed 0.1 ETH");
    players.push(msg.sender);
  }

  function pickWinner() external view OnlyOwner(){
    require(players.length >= 3, "3 or more players needed");

  }

}

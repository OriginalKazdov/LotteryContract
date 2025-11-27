//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Lottery{
  address public owner;
  address payable[] public players;
  uint256 amount = 0.1 ether;

  modifier OnlyOwner(){
    require(owner == msg.sender, "Not an owner");
    _;
  }

  constructor() {
    owner = msg.sender;
  }

  function getBalance() public OnlyOwner view returns(uint){
    return address(this).balance;
  }

  function enter() external payable{
    require(msg.value == amount, "Must send exactly 0.1 ETH");
    players.push(payable(msg.sender));
  }

  function pickWinner() public OnlyOwner{
    require(players.length >= 3, "3 or more players needed");
      // This is not secure but for the love of knowledge I'll do it anyway.
    uint256 random = uint256(keccak256(abi.encodePacked(block.timestamp, block.prevrandao, players.length)));
    uint256 winnerIndex = random % players.length;
    address payable winner = players[winnerIndex];
    (bool ok, ) = winner.call{value: getBalance()}("");
    require(ok, "Transfer failed");
    players = new address payable[](0);
  }

}

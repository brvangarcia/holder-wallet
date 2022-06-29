//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract HWallet {
    uint public constant lockPeriod = 1825 days; //5 years
    uint public endPeriod;
    address payable public immutable owner;

    constructor(address payable _owner) {
        owner = _owner;
    }

    event Deposit(string message);

    event Widthdraw(string message);

    function tokenDeposit(address tokenAddress, uint amountToDeposit) external {
        endPeriod = block.timestamp + lockPeriod;
        IERC20(tokenAddress).transferFrom(msg.sender, address(this), amountToDeposit);
        emit Deposit("Deposit successful");
    }

    receive() external payable {
        endPeriod = block.timestamp + lockPeriod;
        emit Deposit("Deposit successful");
    }

    modifier onlyOwner() {
        require(msg.sender == owner, 'Only owner can widthdraw');
        _;
    }

    modifier isTimeToWithdraw() {
        require(block.timestamp >= endPeriod, 'Keep holding');
        _;
    }

    function withdraw(address token, uint amount) external onlyOwner isTimeToWithdraw  {
    if(token == address(0)) { 
      owner.transfer(amount);
    } else {
      IERC20(token).transfer(owner, amount);
    }
    emit Widthdraw("Widthdraw successful");
  }

}

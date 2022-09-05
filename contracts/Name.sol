// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
contract Name{

    uint balance;

    constructor (){
        balance = 0;
    }

    function deposit(uint amount) public {
        balance += amount;
    }

    function withraw(uint amount) public {
        require(balance>amount , "Not Enough Fund!");
        balance -= amount;
    }

    function getBalance() public view returns(uint){
        return balance;
    }
}
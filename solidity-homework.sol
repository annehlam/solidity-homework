pragma solidity ^0.5.0;

contract AssociateProfitSplitter {
    
    // Create three payable addresses representing 'employee_one', 'employee_two', and 'employee_three'
    // Create three variables for each employee/their address
    
    address payable public employee_one = 0xEFfD15dDbeb8E903D62954F4D774a1868E40B9d7;
    address payable public employee_two = 0x28239Da67c8eCD8dBdC19Ce38CA518B16D5047D2;
    address payable public employee_three = 0xF898B476AbeAd5f85E7b77A8C29A81cc72083751;
 
    //create constructor function that accepts each address payable
 
    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    // split msg.value equally three ways
    
    function deposit() public payable {
        uint amount = msg.value / 3;
        
    //transfer the amount to each employee

        employee_one.transfer(amount);
        employee_two.transfer(amount);
        employee_three.transfer(amount);

        msg.sender.transfer(msg.value - amount * 3); // take care of a potential remainder by sending back to HR
    }

    function() external payable {
        deposit();
    }
}

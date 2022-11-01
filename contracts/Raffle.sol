//SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0 ;
// Raffle
//Enter a lottery(paying some amount)
//Pick a random winner
//Winner to be selected evry x minute============> complete automation 
//Chainlink oracle => randomness, automated Execution using chainlink keeper


contract Raffle {

    uint256 immutable private i_entranceFee; // Declare an immutable entrance fee

    constructor(uint256 entranceFee){
        i_entranceFee = entranceFee; // use the constructor to set the i_entranceFee

    }

    function enterRaffle() public{

    }
}
// Raffle
//Enter a lottery(paying some amount)
//Pick a random winner
//Winner to be selected evry x minute============> complete automation 
//Chainlink oracle => randomness, automated Execution using chainlink keeper
//SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0 ;

error Raffle__NotEnoughETHEntered();
contract Raffle {
    

    uint256 immutable private i_entranceFee; // Declare an immutable entrance fee
    address payable [] private s_players;
    constructor(uint256 entranceFee){
        i_entranceFee = entranceFee; // use the constructor to set the i_entranceFee

    }

    function enterRaffle() public payable{ 
        if(msg.value < i_entranceFee){
            revert Raffle__NotEnoughETHEntered();
        } 
        s_players.push(payable(msg.sender)); // Try removing the payable function to see if is gonna still work 

    }

    function getEntranceFee () public view returns(uint256){
        return i_entranceFee;
    }
    function getWinner (uint256 index) public view returns (address){
        return s_players[index];
    }
}
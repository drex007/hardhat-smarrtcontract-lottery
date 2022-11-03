// Raffle
//Enter a lottery(paying some amount)
//Pick a random winner
//Winner to be selected evry x minute============> complete automation 
//Chainlink oracle => randomness, automated Execution using chainlink keeper
//SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0 ;
import '@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol';
import '@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol';

error Raffle__NotEnoughETHEntered();
contract Raffle is VRFConsumerBaseV2{
    
    // Storage Variables
    uint256 immutable private i_entranceFee; // Declare an immutable entrance fee
    address payable [] private s_players;
    VRFCoordinatorV2Interface private immutable i_vrfCoordinator;
    //Events 
    event RaffleEnter(address indexed player);
    constructor(address vrfCoordinatorV2,uint256 entranceFee) VRFConsumerBaseV2(vrfCoordinatorV2){
        i_entranceFee = entranceFee; // use the constructor to set the i_entranceFee
        i_vrfCoordinator = VRFCoordinatorV2Interface(vrfCoordinatorV2);

    }

    function enterRaffle() public payable{ 
        if(msg.value < i_entranceFee){
            revert Raffle__NotEnoughETHEntered();
        } 
        s_players.push(payable(msg.sender)); // Try removing the payable function to see if is gonna still work 
        emit RaffleEnter(msg.sender);

    }

    function requestRandomWinner () external {

    }

    function fulfillRandomWords(uint256 requestId, uint256[] memory randomWords) internal override{

    }
    /* pure functions */

    function getEntranceFee () public view returns(uint256){
        return i_entranceFee;
    }
    function getPlayer  (uint256 index) public view returns (address){
        return s_players[index];
    }

    //Comment
}
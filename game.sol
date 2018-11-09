pragma solidity ^0.4.7;

contract TicTacToe
{
    address game_master;
    uint256[][9] game_board;
    
    constructor()
    {
        game_master = msg.sender;
    }

    address p1; // player 1
    address p2; // player 2
    
    
    
    
}
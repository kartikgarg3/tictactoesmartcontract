pragma solidity ^0.4.7;

contract TicTacToe
{
    address game_master;
    uint256[][9] game_board;
    uint[][]  game_state_wins = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8],[2,4,6]  ];
    constructor()
    {
        p1 = msg.sender;
    }

    address p1; // player 1
    address p2; // player 2
    
    function registerplayer()
    {
        require(p1 != 0);
        require(p2 == 0);
        p2 = msg.sender;
    }
    
    function select_move()
    {
        
    }
    
    
    
}
pragma solidity ^0.4.7;

contract TicTacToe
{
    address game_master;
    uint256[][9] game_board;
    uint num_winning_states;
    uint[][]  game_state_wins = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8],[2,4,6]  ];
    constructor()
    {
        p1 = msg.sender;
        num_winning_states = 8;
    }

    address p1; // player 1
    address p2; // player 2
    
    function registerplayer()
    {
        require(p1 != 0);
        require(p2 == 0);
        p2 = msg.sender;
    }
    
    function checkWinner() constant returns (uint)
    {
        for(uint j = 0; j < num_winning_states; j++)
        {
            uint[] memory b = game_state_wins[i];
            if(board[b[0]] != 0 && board[b[0]] == board[b[1]] && board[b[0]] == board[b[2]])
            {
                return board[b[0]];
            }
        }
    return 0;
    }
    
    function turn(uint256 index) returns (string)
    {
        uint256 winner = checkWinner();
        if (winner == 1)
        {
            return "Winner is 1";
        }
        if (winner == 2)
        {
            return "Winner is 2"
        }
    }
    
    
    
}
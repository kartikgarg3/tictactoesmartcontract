pragma solidity ^0.4.7;

contract TicTacToe
{
    address game_master;
    uint[] game_board = new uint[](9);
    uint num_winning_states;
    uint player_tracker;
    byte[] signs = new byte[](3); //variable to store the game signs
    uint[][]  game_state_wins = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8],[2,4,6]  ];
    constructor()
    {
        signs[0]="-";
        signs[1]="X";
        signs[2]="O";
    
    
        p1 = msg.sender;
        player_tracker=0;
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
            uint[] memory b = game_state_wins[j];
            if(game_board[b[0]] != 0 && game_board[b[0]] == game_board[b[1]] && game_board[b[0]] == game_board[b[2]])
            {
                return game_board[b[0]];
            }
        }
    return 0;
    }
    
    function turn(uint256 index) returns (string)
    {
        uint256 winner = checkWinner(); // check if we already have a winner
        
        if (winner == 1)
        {
            return "Winner is 1";
        }
        if (winner == 2)
        {
            return "Winner is 2";
        }
        
        if(index<0||index>9)
        {
            return "Index Out of Range";
        }
        
        if(player_tracker == 0){
            if(msg.sender != p1) return "you are not player 1";
        }else if(player_tracker == 1){
            if(msg.sender != p2) return "you are not player 2";
}
        
        // require(index < 9);
        // require(game_board[index] != 0);
        game_board[index] = player_tracker + 1;
        player_tracker = 1-player_tracker ; // changing the state bacl
        return "Move has been made" ;
    }
    
    function return_game_board() returns (string,string)
    {
     string memory text="Game in progress";
     uint Winner = checkWinner();
     if(Winner==2)
     {
         text="winner is 2";
     }
     if(Winner==1)
     {
        text="winner is 1";
         
     }
     
     
     bytes memory displayboard = new bytes(11);
     bytes(displayboard)[3] = "|";
     bytes(displayboard)[7] = "|";
     
     uint k=0;
     while(k < 9)
     {
        bytes(displayboard)[k + k/3] = signs[game_board[k]];
        k++;
         
     }
     return (text,string(displayboard));
    }
    
}

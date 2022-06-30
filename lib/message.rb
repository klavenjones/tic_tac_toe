# frozen_string_literal: true

class Message
  def self.welcome
    "\n\n-----------------------------------------------------\n
     Welcome To Tic Tac Toe
    \n-----------------------------------------------------"
  end

  def self.instruction
    "\n\nPlease pick a spot by pressing one number in the range of 1-9\n\nIf you want to quit and save this game please type S\n"
  end

  def self.game_mode_prompt
    "\n\nPlease select the game mode you would like to play (Select 1 or 2): \n1. Human vs. Human\n2. Computer vs. Human\n\n"
  end

  def self.player_game_mode_choice(choice)
    if choice == 1
      "\n\nYou have chosen play game mode 1: Human vs. Human.\n\n"
    else
      "\n\nYou have chosen play game mode 2: Computer vs. Human.\n\n"
    end
  end

  def self.display_board(board_grid)
    "\n #{board_grid[0]} | #{board_grid[1]} | #{board_grid[2]} \n---|---|---\n #{board_grid[3]} | #{board_grid[4]} | #{board_grid[5]}  \n---|---|---\n #{board_grid[6]} | #{board_grid[7]} | #{board_grid[8]} \n\n\n"
  end

  def self.ask_for_custom_marker
    "\n\nPlease choose a custom marker to identify yourself on the board. ex. A, B, C\n\n"
  end

  def self.ask_to_revisit_game
    "\n\nBefore we start, what would you like to do? start a new game, play an existing game, or view old game results? \n\n1. Start a new game \n2. Play an existing game.\n3. View Game Results."
  end

  def self.ask_to_save_game
    "\nWould you like to save the result of the game?\nPress Y for Yes\nPress N for No\n"
  end

  def self.show_games_message
    "\n\nHere are all your existing games: \n\n"
  end

  def self.show_results_message
    "\n\nHere are all of the results you saved: \n\n"
  end

  def self.player_custom_marker(player)
    "\n\nPlayer #{player}: please choose your custom marker.\n\n"
  end

  def self.player_custom_marker_choice(player, marker)
    "\n\nPlayer #{player} your marker choice is: #{marker}.\n\n"
  end

  def self.winner(player)
    "\n\nPlayer #{player} is the winner.\n\n"
  end

  def self.save_game_success
    "\n\nYou have successfully saved the game. Bye Bye!\n"
  end

  def self.save_game_declined
    "\n\nYou have chosen not to save the game. Bye Bye!\n"
  end

  def self.current_player(marker)
    "\nPlayer #{marker} it's your turn to make a move."
  end

  def self.players_move(marker, move)
    "\nPlayer #{marker} chose the spot labeled: #{move}\n"
  end

  def self.computers_move(marker, move)
    "\nComputer player #{marker} chose the spot labeled: #{move}\n"
  end

  def self.tie
    "\n\nThe game has ended in a tie.\n\n"
  end

  def self.invalid_move_error
    "\nThat was an invalid move, please enter a number in the range of 1-9\n"
  end

  def self.invalid_marker_error
    "\nThat is an invalid marker, please enter any letter from A to Z\n"
  end

  def self.invalid_game_mode_error
    "\nInvalid game mode choice, please pick either game mode 1 or 2: \n1. Human Vs Human\n2. Computer vs Human\n"
  end

  def self.invalid_save_game_error
    "\nInvalid save game choice, please type either: \nY for Yes \nN for No\n"
  end

  def self.duplicate_marker_error
    "\nPlayer one has chosen this marker already. Please select a marker that is unique.\n"
  end

  def self.exit
    'Thanks for playing Tic Tac Toe!'
  end
end

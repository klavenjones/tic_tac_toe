# frozen_string_literal: true

class Message
  def self.welcome
    "\n\n-----------------------------------------------------\n
     Welcome To Tic Tac Toe
    \n-----------------------------------------------------"
  end

  def self.instruction
    "\n\nPlease pick a spot by pressing one number in the range of 1-9\n\n"
  end

  def self.winner(player)
    "\n\nPlayer #{player} is the winner.\n\n"
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

  def self.exit
    'Thanks for playing Tic Tac Toe!'
  end
end

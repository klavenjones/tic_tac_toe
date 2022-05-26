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

  def self.mode_select
    "\nPlease select a game mode:\n 1. Human vs Human\n Human vs Computer\n"
  end

  def self.winner(player)
    "Player #{player} is the winner."
  end

  def self.tie
    'The game has ended in a tie.'
  end

  def self.exit
    'Thanks for playing Tic Tac Toe!'
  end
end

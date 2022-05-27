# frozen_string_literal: true

require 'message'
require 'board'

class Prompt
  @board = Board.new

  def self.welcome
    print_message(Message.welcome)
  end

  def self.print_instruction
    print_message(Message.instruction)
  end

  def self.print_board
    print_message(@board.display_board)
  end

  def self.print_current_player(marker)
    print_message(Message.current_player(marker))
  end

  def self.print_message(msg)
    print msg
  end
end

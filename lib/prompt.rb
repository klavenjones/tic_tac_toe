# frozen_string_literal: true

require 'message'
require 'board'

class Prompt
  def self.welcome
    print_message(Message.welcome)
  end

  def self.print_instruction
    print_message(Message.instruction)
  end

  def self.print_board
    print_message(Board.display_board)
  end

  def self.print_message(msg)
    print msg
  end
end

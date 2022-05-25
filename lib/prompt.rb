require "message"
require "board"

class Prompt
  def self.welcome
    self.print_message(Message.welcome)
  end

  def self.print_instruction
    self.print_message(Message.instruction)
  end

  def self.print_board
    self.print_message(Board.display_board)
  end

  def self.print_message(msg)
    print msg
  end
end

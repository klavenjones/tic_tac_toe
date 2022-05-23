class Message
  def welcome
    "-----------------------------------------------------\nWelcome To Tic Tac Toe\n-----------------------------------------------------"
  end

  def instruction
    "Please pick a spot by pressing one number in the range of 1-9"
  end

  def winner(player)
    "Player #{player} is the winner."
  end

  def tie
    "The game has ended in a tie."
  end
end

message = Message.new

puts message.welcome

require 'human'
require 'computer'
require 'prompt'
require 'board'

class PlayerBuilder

    attr_accessor :player
  
    def initialize(type = "Human")
        if type == "Computer"
            @player = Computer.new
        else 
            @player = Human.new
        end
    end

    def set_player_marker(marker)
        @player.marker = marker
    end

    def set_player_prompt(prompt)
        @player.prompt = prompt
    end
    

end
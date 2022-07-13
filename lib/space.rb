class Space
    attr_accessor :marker, :space_index, :time_on_board
    def initialize(marker, space_index)
      @marker = marker
      @space_index = space_index
      @time_on_board = 0
    end
  
    def update_marker(marker)
      @marker = marker
    end
  
    def reset_marker
      @marker = (space_index - 1).to_s
    end
  
    def update_time_on_board
       @time_on_board += 1
    end
end
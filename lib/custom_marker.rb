class CustomMarker
    attr_accessor :player1, :player2, :player1_marker_choice, :player2_marker_choice
    
    def initialize(prompt, player1, player2)
        @player1 = player1
        @player2 = player2
        @prompt = prompt
    end

    def choose_custom_marker
        @prompt.print_ask_for_custom_marker
        get_player1_marker
        set_player1_marker
        get_player2_marker
        set_player2_marker
    end

    def get_player1_marker
        @prompt.print_player_custom_marker(1)
        @player1_marker_choice = @prompt.get_custom_marker
        @prompt.print_player_custom_marker_choice(1, player1_marker_choice)
    end

    def get_player2_marker
        @prompt.print_player_custom_marker(2)
        @player2_marker_choice = @prompt.get_custom_marker
        @prompt.print_player_custom_marker_choice(2, player2_marker_choice)
    end

    def set_player1_marker
        @player1.marker = @player1_marker_choice
    end

    def set_player2_marker
        @player2.marker = @player2_marker_choice
    end

end
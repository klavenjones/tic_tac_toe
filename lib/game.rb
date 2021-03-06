# frozen_string_literal: true

require 'prompt'
require 'input_validation'
require 'board'

class Game
  attr_accessor :board, :prompt, :players, :current_player, :winning_player

  def initialize(args)
    @board = args[:board]
    @prompt = args[:prompt]
    @players = args[:players]
    @current_player = args[:players][0]
    @winning_player = args[:players][0]
    @database_actions = args[:database_actions]
  end

  def start_game
    @prompt.print_board
    turn
  end

  def turn
    until game_over?
      @prompt.print_current_player(@current_player.marker)
      @prompt.print_instruction
      choice = @current_player.get_move
      if InputValidation.valid_in_game_save_choice?(choice)
        save_game
        break
      end
      play_turn(@current_player, choice.to_i)
      @prompt.print_board
    end
    end_game(choice)
  end

  def play_turn(player, move)
    if valid_move?(move)
      @board.update_board(player.marker, move)
      set_winning_player(player) if @board.winner?
      update_current_player
    else
      @prompt.print_invalid_move_error
    end
  end

  def update_current_player
    set_current_player(@players.reverse![0])
  end

  def set_current_player(current_player)
    @current_player = current_player
  end

  def game_over?
    @board.full? || @board.winner?
  end

  def set_winning_player(winning_player)
    @winning_player = winning_player
  end

  def valid_move?(input)
    !@board.spot_taken?(input) && InputValidation.valid_number?(input)
  end

  def valid_in_game_save_choice?(input)
    InputValidation.valid_in_game_save_choice?(input)
  end

  def status
    if board.full? && !board.winner?
      @prompt.print_tie
    else
      @prompt.print_winner(@winning_player.marker)
    end
  end

  def save_result
    @prompt.print_ask_to_save_game
    choice = @prompt.get_save_game_choice
    if choice == 'Y'
      columns = 'winner, loser, board, date'
      losing_player = @players[0] == @winning_player ? @players[1] : @players[0]
      values = [@winning_player.marker, losing_player.marker, @board.board_grid.join]
      @database_actions.create_table('results', 'winner VARCHAR, loser VARCHAR, board VARCHAR')
      @database_actions.save('results', columns, values)
      @prompt.print_save_game_success
    else
      @prompt.print_save_game_declined
    end
  end

  def save_game
    columns = 'type, current_player, opposing_player, board, date'
    game_type = @players[0].type == 'Computer' ? 'Computer vs. Human' : 'Human vs Human'
    @opposing_player = @players[0] == @current_player ? @players[1] : @players[0]
    values = [game_type, @current_player.marker, @opposing_player.marker, @board.board_grid.join]
    @database_actions.create_table('games', 'type VARCHAR, current_player VARCHAR, opposing_player VARCHAR, board VARCHAR')
    @database_actions.save('games', columns, values)
  end

  def end_game(choice)
    if InputValidation.valid_in_game_save_choice?(choice)
      @prompt.print_save_game_success
    else
      status
      save_result
    end
  end
end

# frozen_string_literal: true

require 'prompt'
require 'input_validation'
require 'board'

class Lite3Game
  attr_reader :board, :prompt, :player1, :player2, :current_player, :winning_player

  # rubocop:disable Metrics/ParameterLists
  def initialize(board, prompt, player1, player2, game_database_actions, results_database_actions)
    @board = board
    @prompt = prompt
    @player1 = player1
    @player2 = player2
    @current_player = player1
    @winning_player = player1
    @game_database_actions = game_database_actions
    @results_database_actions = results_database_actions
  end
  # rubocop:enable Metrics/ParameterLists

  def start_game
    @prompt.print_lite3_board
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
      @prompt.print_lite3_board
    end

    end_game(choice)
  end

  def play_turn(player, move)
    if valid_move?(move)
      update_board(player, move)
      set_winning_player(player) if @board.winner?
      update_current_player
    else
      @prompt.print_invalid_move_error
    end
  end

  def update_board(player, move)
    player == @player1 ? @board.mark_board(@player1.marker, move) : @board.mark_board(@player2.marker, move)
    update_lite3_board
  end

  def update_current_player
    @current_player == @player1 ? set_current_player(@player2) : set_current_player(@player1)
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
    board.full? && !board.winner? ? @prompt.print_tie : @prompt.print_winner(@winning_player.marker)
  end

  def save_result
    @prompt.print_ask_to_save_game
    choice = @prompt.get_save_game_choice
    losing_player = @player1 == @winning_player ? @player2 : @player1
    @results_database_actions.save_result(@winning_player.marker, losing_player.marker, @board.board_grid.join) if choice == 'Y'
    choice == 'Y' ? @prompt.print_save_game_success : @prompt.print_save_game_declined
  end

  def save_game
    game_type = @player1.type == 'Computer' ? 'Computer vs. Human' : 'Human vs Human'
    @opposing_player = @player1 == @current_player ? @player2 : @player1
    @game_database_actions.save_game(game_type, @current_player.marker, @opposing_player.marker, @board.board_grid.join)
  end

  def update_lite3_board
    @board.board_grid.each do |space|
      space[:time_on_board] = space[:time_on_board] + 1 unless space[:marker].match(/^[[:digit:]]$/)
      space[:marker] = (space[:space_index] + 1).to_s if space[:time_on_board] > 4
      space[:time_on_board] = 0 if space[:time_on_board] > 4
    end
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

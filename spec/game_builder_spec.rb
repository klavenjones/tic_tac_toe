# frozen_string_literal: true

require 'game'
require 'lite3_game'
require 'lite3_board'
require 'board'
require 'game_builder'
require 'player_builder'
require 'results_database_actions'

describe GameBuilder do
  it 'should return the mode a player chose' do
    builder = GameBuilder.new(1)
    expect(builder.mode).to eq(1)
  end

  it 'should return player1 based on the player set' do
    builder = GameBuilder.new(1)
    player_builder = PlayerBuilder.new('Human')
    builder.set_player_one(player_builder.player)
    expect(builder.player1).to eq(player_builder.player)
  end

  it 'should return player2 based on the player set' do
    builder = GameBuilder.new(1)
    player_builder = PlayerBuilder.new('Human')
    builder.set_player_two(player_builder.player)
    expect(builder.player2).to eq(player_builder.player)
  end

  it 'should return the board based on the board set' do
    builder = GameBuilder.new(1)
    board = Board.new
    builder.set_board(board)
    expect(builder.board).to eq(board)
  end

  it 'should return the lite3 board based on the board set' do
    builder = GameBuilder.new(1)
    board = Lite3Board.new
    builder.set_board(board)
    expect(builder.board).to eq(board)
  end

  it 'should return the prompt based on the prompt set' do
    builder = GameBuilder.new(1)
    board = Board.new
    prompt = Prompt.new(board)
    builder.set_prompt(prompt)
    expect(builder.prompt).to eq(prompt)
  end

  it 'should return the database actions based on the actions set' do
    builder = GameBuilder.new(1)
    results_database_actions = ResultsDatabaseActions.new('test.db')
    builder.set_results_database_actions(results_database_actions)
    expect(builder.results_database_actions).to eq(results_database_actions)
    File.delete('test.db')
  end
end

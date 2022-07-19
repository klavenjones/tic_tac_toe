# frozen_string_literal: true

require 'game'
require 'board'
require 'lite3_board'
require 'game_builder'
require 'player_builder'
require 'results_database_actions'

describe GameBuilder do
  it 'should return the mode a player chose' do
    builder = GameBuilder.new(1)
    expect(builder.mode).to eq(1)
  end

  it 'should return player 1 based on the player set' do
    builder = GameBuilder.new(1)
    player1_builder = PlayerBuilder.new('Human')
    player2_builder = PlayerBuilder.new('Human')
    players = [player1_builder.player, player2_builder.player]
    builder.set_players(players)
    expect(builder.players[1]).to eq(players[1])
  end

  it 'should return player2 based on the player set' do
    builder = GameBuilder.new(1)
    player1_builder = PlayerBuilder.new('Human')
    player2_builder = PlayerBuilder.new('Human')
    players = [player1_builder.player, player2_builder.player]
    builder.set_players(players)
    expect(builder.players[0]).to eq(players[0])
  end

  it 'should return the board based on the mode set' do
    builder = GameBuilder.new(1)
    builder.set_board
    expect(builder.board).to be_instance_of(Board)
  end

  it 'should return the lite3 board based on the mode set' do
    builder = GameBuilder.new(3)
    builder.set_board
    expect(builder.board).to be_instance_of(Lite3Board)
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

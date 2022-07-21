# frozen_string_literal: true

require 'game'
require 'board'
require 'prompt'
require 'lite3_board'
require 'game_builder'
require 'player_builder'
require 'database_actions'

describe GameBuilder do
  before(:each) do
    @board = Board.new
  end

  it 'should return the mode a player chose' do
    builder = GameBuilder.new(1)
    expect(builder.mode).to eq(1)
  end

  it 'should return player 1 marker based on the player set' do
    builder = GameBuilder.new(1)
    markers = %w[O X]
    @database_actions = DatabaseActions.new('test.db')
    builder.build_game(markers, @database_actions)
    expect(builder.players[1].marker).to eq('X')
  end

  it 'should return player2 marker based on the player set' do
    builder = GameBuilder.new(1)
    markers = %w[O X]
    builder.build_game(markers)
    expect(builder.players[0].marker).to eq('O')
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
    builder.set_prompt
    expect(builder.prompt).to be_instance_of(Prompt)
  end

  it 'should return the database actions based on the actions set' do
    builder = GameBuilder.new(1)
    database_actions = DatabaseActions.new('test.db')
    builder.set_database_actions(database_actions)
    expect(builder.database_actions).to eq(database_actions)
    File.delete('test.db')
  end
end

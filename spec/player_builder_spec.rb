# frozen_string_literal: true

require 'computer'
require 'human'
require 'player_builder'
require 'prompt'
require 'board'

describe PlayerBuilder do
  let(:board) { Board.new }
  let(:prompt) { Prompt.new(board) }

  it 'should be a computer player' do
    builder = PlayerBuilder.new
    builder.build_player(prompt, 'O', 2)
    expect(builder.player.type).to eq('Computer')
  end

  it 'should be a human player' do
    builder = PlayerBuilder.new
    expect(builder.player.type).to eq('Human')
  end

  it 'should be an instance of the prompt class' do
    builder = PlayerBuilder.new
    builder.set_player_prompt(prompt)
    expect(builder.player.prompt).to be_a Prompt
  end
end

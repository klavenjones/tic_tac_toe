# frozen_string_literal: true

require 'custom_marker'
require 'board'
require 'human'
require 'prompt'

describe CustomMarker do
  let(:board) { Board.new }
  let(:prompt) { Prompt.new(board) }
  let(:player1) { Human.new('O', prompt) }
  let(:player2) { Human.new('X', prompt) }
  subject(:custom_marker) { described_class.new(prompt, player1, player2) }

  describe '#get_player1_marker' do
    it 'should get custom marker for player 1 and print result' do
      allow(prompt).to receive(:gets).and_return('a')
      expect do
        custom_marker.get_player1_marker
      end.to output("\n\nPlayer 1: please choose your custom marker.\n\n\n\nPlayer 1 your marker choice is: A.\n\n").to_stdout
    end
  end

  describe '#get_player2_marker' do
    it 'should get custom marker for player 2 and print result' do
      allow(prompt).to receive(:gets).and_return('b')
      expect do
        custom_marker.get_player2_marker
      end.to output("\n\nPlayer 2: please choose your custom marker.\n\n\n\nPlayer 2 your marker choice is: B.\n\n").to_stdout
    end
  end

  describe '#set_player_marker1' do
    it 'should set player 1 custom marker' do
      custom_marker.player1_marker_choice = 'A'
      custom_marker.set_player1_marker
      expect(custom_marker.player1.marker).to eq('A')
    end
  end

  describe '#set_player_marker2' do
    it 'should set player 1 custom marker' do
      custom_marker.player2_marker_choice = 'R'
      custom_marker.set_player2_marker
      expect(custom_marker.player2.marker).to eq('R')
    end
  end
end

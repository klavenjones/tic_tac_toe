# frozen_string_literal: true

$LOAD_PATH << './lib'
require 'game_runner'

tic_tac_toe = GameRunner.new

tic_tac_toe.begin_session

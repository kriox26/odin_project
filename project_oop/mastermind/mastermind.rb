require 'colorize'
require './lib/game.rb'
require './lib/mm_module.rb'
require './lib/board.rb'
require './lib/mastermind_game.rb'
require './lib/player.rb'
require './lib/ai.rb'
include Mastermind

mastermind_game = MastermindGame.new()
mastermind_game.play

require_relative 'lib/intro'
require_relative 'lib/game'
require_relative 'lib/new_game'
require_relative 'lib/save_load.rb'

require 'yaml'

include Intro

game_mode = game_intro
game = Game.new
game.load_game if game_mode == 'LOAD'
game.play_game
require_relative 'lib/intro'
require_relative 'lib/game'
require_relative 'lib/new_game'
require_relative 'lib/save_load.rb'

require 'yaml'

include Intro

game_mode = game_intro
save_game_message
game = Game.new
game.load_game if game_mode == '2'
game.play_game
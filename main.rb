require_relative 'lib/intro'
require_relative 'lib/game'
require_relative 'lib/new_game'

include Intro

game_mode = game_intro
if game_mode == 'LOAD'
  puts 'load YAML here'
else
  game = Game.new
end
game.play_game
require 'yaml'

require_relative 'game'

module SaveLoad
  def save_game
    game_state = {
      word: @word,
      word_array: @word_array,
      word_display: @word_display,
      guesses_remaining: @guesses_remaining,
      guesses: @guesses
    }

    puts "*****************************"
    puts "Game is now being saved."

    game_path = ""

    loop do
      puts "Please enter save file name. Omit .yaml suffix:"
      game_name = gets.chomp
      game_name << ".yaml"
      folder_path = File.expand_path('../saved', __dir__)
      game_path = File.join(folder_path, game_name)

      if File.exist?(game_path)
        puts "#{game_path} already exists. Would you like to overrwrite this file? (y/n)"
        overrwrite = gets.chomp.upcase
        if overrwrite == 'Y'
          break
        end
      else
        break
      end
    end

    File.write(game_path, game_state.to_yaml)
    
    puts "*****************************"
    puts "Game succesfully saved!"

    continue_game?
  end

  def load_game
    puts "*****************************"
    puts "Enter file name to be loaded. Omit. yaml:"
    game_name = gets.chomp
    game_name << ".yaml"
    folder_path = File.expand_path('../saved', __dir__)
    game_path = File.join(folder_path, game_name)
    game_state = YAML.load_file(game_path)

    @word = game_state[:word]
    @word_array = game_state[:word_array]
    @word_display = game_state[:word_display]
    @guesses_remaining = game_state[:guesses_remaining]
    @guesses = game_state[:guesses]
  end
end

def continue_game?
  puts "*****************************"
  puts "Would you like to continue your game?"
  puts "Enter 'Y to continue:"
  continue = gets.chomp.upcase
  if continue != 'Y'
    puts "*****************************"
    puts "Thanks for playing. Goodbye!"
    exit
  else
    play_game
  end
end
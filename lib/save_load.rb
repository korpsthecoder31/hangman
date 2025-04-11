require 'yaml'

module SaveLoad
  def save_game
    game_state = {
      word: @word,
      word_array: @word_array,
      word_display: @word_display,
      guesses_remaining: @guesses_remaining,
      guesses: @guesses
    }

    puts "Game is now being saved. Please enter save file name. Omit .yaml:"
    game_name = gets.chomp
    game_name << ".yaml"
    game_path = File.join(File.dirname(__FILE__), game_name)
    File.write(game_path, game_state.to_yaml)

    exit
  end

  def load_game
    puts "Enter file name to be loaded. Omit. yaml:"
    game_name = gets.chomp
    game_name << ".yaml"
    game_path = File.join(File.dirname(__FILE__), game_name)
    game_state = YAML.load_file(game_path)

    @word = game_state[:word]
    @word_array = game_state[:word_array]
    @word_display = game_state[:word_display]
    @guesses_remaining = game_state[:guesses_remaining]
    @guesses = game_state[:guesses]
  end
end
require_relative 'new_game'
require_relative 'save_load'

include SaveLoad

class Game < NewGame
  def initialize
    super
    @guesses_remaining = 6
    @guesses = []
  end

  def play_game
    puts @word
    print_display
    loop do
      player_guess = get_letter
      check_guess(player_guess)
      print_display
      break if @guesses_remaining == 0 || !@word_display.include?(nil)
    end
    game_over
  end

  def print_display
    display = String.new
    @word_display.each do |letter|
      if letter.nil?
        display << "_ "
      else
        display << letter << " "
      end
    end
    puts "Current Word:"
    puts display
  end

  def get_letter
    puts "Please select letter:"
    guess = gets.chomp.upcase
    if guess == 'SAVE'
      save_game
    end
    loop do
      if guess.length == 1 && (guess >= 'A' && guess <= 'Z')
        if @guesses.include?(guess)
          puts "Selection has already been used. Try again."
          guess = gets.chomp.upcase 
        else
          return guess
        end 
      else
        puts "Selection is not a valid letter. Try again."
        guess = gets.chomp.upcase  
      end 
    end
  end

  def check_guess(letter)
    @guesses << letter
    if @word.include?(letter)
      puts "Correct guess."
      update_display(letter)
    else
      @guesses_remaining -= 1
      puts "Incorrect guess. You have #{@guesses_remaining} lives left."
    end
  end

  def update_display(correct_guess)
    @word_array.each_with_index do |letter, index|
      if letter == correct_guess
        @word_display[index] = letter
      end    
    end
  end

  def game_over
    if @guesses_remaining == 0
      puts "*****************************"
      puts "Game Over. You lose."
      puts "Your word was #{@word}."
    else
      puts "*****************************"
      puts "Congratulations. You win!"
    end
  end

end

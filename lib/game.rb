class Game
  def initialize
    @word = get_word
    @guesses_remaining = 6
    @guesses = []
  end

  def get_word
    words = File.open("google-10000-english-no-swears.txt").map(&:strip)
    loop do
      word = words.sample.upcase
      return word if word.length >= 5 && word.length <=12
    end
  end

  def play_game
    puts @word
    loop do
      player_guess = get_letter
      check_guess(player_guess)
      break if @guesses_remaining == 0
    end
  end

  def get_letter
    puts "Please select letter:"
    guess = gets.chomp.upcase
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
      puts "Correct guess"
    else
      puts "Incorrect guess"
      @guesses_remaining -= 1
    end
  end

end

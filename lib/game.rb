class Game
  def initialize
    @word = get_word
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
      player_guess
    end
  end

  def player_guess
    puts "Please select letter:"
    guess = gets.chomp.upcase
    loop do
      if guess.length == 1 && (guess >= 'A' && guess <= 'Z')
        return guess
      else
        puts "Selection is not a valid letter. Try again."
        guess = gets.chomp.upcase  
      end 
    end
  end
end

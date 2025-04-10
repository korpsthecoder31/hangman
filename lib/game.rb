class Game
  def initialize
    @word = get_word
    @guesses_remaining = 6
    @guesses = []
    @word_array = get_word_array
    @word_display = get_blank_display
  end

  def get_word
    words = File.open("google-10000-english-no-swears.txt").map(&:strip)
    loop do
      word = words.sample.upcase
      return word if word.length >= 5 && word.length <=12
    end
  end

  def get_word_array
    display = Array.new
    @word.each_char do |letter|
      display << letter
    end
    display
  end

  def get_blank_display
    display = Array.new
    @word.each_char do |letter|
      display << nil
    end
    display
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
    puts "Game Over"
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
      update_display(letter)
    else
      puts "Incorrect guess"
      @guesses_remaining -= 1
    end
  end

  def update_display(correct_guess)
    @word_array.each_with_index do |letter, index|
      if letter == correct_guess
        @word_display[index] = letter
      end    
    end
  end

end

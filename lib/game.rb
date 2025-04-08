class Game
  def initialize
    @word = get_word
  end

  def get_word
    word_file = File.open("google-10000-english-no-swears.txt")
    loop do
      word = File.readlines(word_file).sample
      if word.length >= 5 && word.length <=12
        return word
      end
    end
  end

  def play_game
    puts @word
  end
end

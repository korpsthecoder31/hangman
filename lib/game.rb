class Game
  def initialize
    @word = get_word
  end

  def get_word
    word_file = File.open("google-10000-english-no-swears.txt")
    File.readlines(word_file).sample
  end

  def play_game
    puts @word
  end
end

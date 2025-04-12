class NewGame
  def initialize
    @word = get_word
    @word_array = get_word_array
    @word_display = get_blank_display
  end

  def get_word
    words = File.open("hangman.txt").map(&:strip)
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
end
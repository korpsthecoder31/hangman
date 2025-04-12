module Intro
  def game_intro
    puts "LET'S PLAY HANGMAN"
    puts "*****************************"
    puts "Enter '1' to start New Game."
    puts "Enter '2' to Load Game."
    gets.chomp.upcase
  end

  def save_game_message
     puts "*****************************"
     puts "You may save your progress at any point by typing 'SAVE'."
     puts "*****************************"
  end
end
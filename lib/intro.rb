module Intro
  def game_intro
    puts "LET'S PLAY HANGMAN"
    puts "To load previous game, enter 'LOAD'."
    puts "Else, enter any key to start a new game."
    gets.chomp.upcase
  end
end
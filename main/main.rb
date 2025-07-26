require_relative '../lib/hangman_persistence'
require_relative '../lib/hangman_runner'

def random_word
  File.readlines('google-10000-english-no-swears.txt', chomp: true).sample
end
puts '🎲 Welcome to Hangman!'
puts "Type 'new' to start a new game or 'load' to resume:"
choice = gets.chomp.downcase
game = if choice == 'load'
         saves = HangmanPersistence.list_saves
         if saves.empty?
           puts 'No saved games found.'
           HangmanGame.new(random_word)
         else
           puts 'Choose a saved game: '
           saves.each_with_index { |file, i| puts "#{i + 1}. #{file}" }
           index = gets.chomp.to_i - 1
           HangmanPersistence.load(saves[index])
         end
       else
         HangmanGame.new(random_word)
       end
HangmanRunner.new(game).play

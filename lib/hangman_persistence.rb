require 'json'
require_relative '../lib/hangman_game'

# Provides methods for saving and loading Hangman game state to and from JSON files.
module HangmanPersistence
  # Loads a saved Hangman game from a JSON file
  #
  # @param filename [String] path to the JSON save file
  # @return [HangmanGame] the restored Hangman game instance
  def self.load(filename)
    data = JSON.parse(File.read(filename))
    HangmanGame.new(data['word'], data['guesses_left'], data['display_array'])
  end

  # Saves the current Hangman game state to a JSON file
  #
  # @param game [HangmanGame] the game instance to save
  # @param filename [String] path to the destination JSON file
  def self.save(game, filename)
    File.write(filename, JSON.pretty_generate({

                                                word: game.word,

                                                guesses_left: game.guesses_left,

                                                display_array: game.display_array

                                              }))
  end

  # Lists all saved game files in the 'games' directory
  #
  # @return [Array<String>] list of filenames matching '*.json'
  def self.list_saves
    Dir.glob('games/*.json')
  end
end

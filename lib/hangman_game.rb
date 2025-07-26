# frozen_string_literal: true

# Handles the core game logic and state for a Hangman game.
class HangmanGame
  # @return [String] the target word to guess
  # @return [Integer] the number of remaining guesses
  # @return [Array<String>] the current display state of the word, e.g., ["p", "_", "z", "z", "_", "e"]
  attr_reader :word, :guesses_left, :display_array

  # Initializes a new game state
  #
  # @param word [String] the word the player has to guess
  # @param guesses_left [Integer] how many incorrect guesses are allowed
  # @param display_array [Array<String>, nil] the display state of the word (optional)
  def initialize(word, guesses_left = 7, display_array = nil)
    @word = word
    @guesses_left = guesses_left
    @display_array = display_array || Array.new(word.length, '_')
  end

  # Reveals all positions of a guessed letter in the word
  #
  # @param letter [String] the guessed letter
  # @return [Boolean] true if the letter was found, false otherwise
  def reveal_letter(letter)
    revealed = false
    word.chars.each_with_index do |char, idx|
      if char == letter
        @display_array[idx] = letter
        revealed = true
      end
    end
    revealed
  end

  # Decrements the number of remaining guesses (used when a guess is incorrect)
  #
  # @return [Integer] updated guesses_left value
  def incorrect_guess
    @guesses_left -= 1
  end

  # Checks if the player has guessed the entire word
  #
  # @return [Boolean] true if no underscores remain, false otherwise
  def win?
    !@display_array.include?('_')
  end

  # Checks if the player has run out of guesses
  #
  # @return [Boolean] true if no guesses remain, false otherwise
  def lost?
    @guesses_left.zero?
  end
end

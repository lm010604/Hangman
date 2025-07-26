require_relative 'hangman_game'
require_relative 'hangman_persistence'
require_relative '../main/hangman_CLI'

# Coordinates the interactive gameplay loop for a Hangman session.
class HangmanRunner
  # Initializes the runner with a given HangmanGame instance.
  #
  # @param game [HangmanGame] a game instance to play
  def initialize(game)
    @game = game
    @filename = ''
  end

  # Starts the game loop.
  #
  # Repeatedly shows game status and accepts player input until
  # the game ends in a win or loss. Supports saving progress.
  def play
    until @game.win? || @game.lost?
      show_status
      puts "Type a letter or 'save': "
      input = gets.chomp.downcase
      handle_input(input)
    end
    HangmanCLI.render(0) if @game.lost?
    puts "\nFinal word: #{@game.word}"
    puts @game.win? ? 'You win!' : 'You lost!'
  end

  # Renders the current status of the game.
  #
  # Displays the CLI representation, letters revealed so far,
  # and remaining guesses.
  def show_status
    HangmanCLI.render(@game.guesses_left)
    puts "\n" + @game.display_array.join(' ')
    puts "\nGuesses left: #{@game.guesses_left}"
  end

  # Handles player input during gameplay.
  #
  # Accepts either:
  # - A valid single-letter guess
  # - The keyword 'save' to store progress
  # Invalid inputs prompt an error message.
  #
  # @param input [String] the player's entry
  def handle_input(input)
    if input == 'save'
      puts 'Filename to save as: '
      @filename = "games/#{gets.chomp.strip}.json"
      HangmanPersistence.save(@game, @filename)
      puts "Game to saved to #{@filename}."
    end
    if input.match?(/^[a-z]$/)
      revealed = @game.reveal_letter(input)
      @game.incorrect_guess unless revealed
      return
    end
    puts "Invalid input. Please type a single letter or 'save'."
  end
end

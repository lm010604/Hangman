module HangmanCLI
  def self.render(guesses_left)
    case guesses_left
    when 7
      seven_guesses_left
    when 6
      six_guesses_left
    when 5
      five_guesses_left
    when 4
      four_guesses_left
    when 3
      three_guesses_left
    when 2
      two_guesses_left
    when 1
      one_guess_left
    when 0
      zero_guesses_left
    end
  end

  def self.seven_guesses_left
    puts '--------'
    puts '|      |'
    puts '|'
    puts '|'
    puts '|'
    puts '|'
    puts '|'
    puts '----'
  end

  def self.six_guesses_left
    puts '--------'
    puts '|      |'
    puts '|      O'
    puts '|'
    puts '|'
    puts '|'
    puts '|'
    puts '----'
  end

  def self.five_guesses_left
    puts '--------'
    puts '|      |'
    puts '|      O'
    puts '|      |'
    puts '|'
    puts '|'
    puts '|'
    puts '----'
  end

  def self.four_guesses_left
    puts '--------'
    puts '|      |'
    puts '|      O'
    puts '|     \\|'
    puts '|'
    puts '|'
    puts '|'
    puts '----'
  end

  def self.three_guesses_left
    puts '--------'
    puts '|      |'
    puts '|      O'
    puts '|     \\|/'
    puts '|'
    puts '|'
    puts '|'
    puts '----'
  end

  def self.two_guesses_left
    puts '--------'
    puts '|      |'
    puts '|      O'
    puts '|     \\|/'
    puts '|      |'
    puts '|'
    puts '|'
    puts '----'
  end

  def self.one_guess_left
    puts '--------'
    puts '|      |'
    puts '|      O'
    puts '|     \\|/'
    puts '|      |'
    puts '|     / '
    puts '|'
    puts '----'
  end

  def self.zero_guesses_left
    puts '--------'
    puts '|      |'
    puts '|      O'
    puts '|     \\|/'
    puts '|      |'
    puts '|     / \\'
    puts '|'
    puts '----'
  end
end

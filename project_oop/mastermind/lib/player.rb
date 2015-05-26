class Player
  attr_reader :name
  def initialize
    print 'Player name: '
    @name = gets.chomp
  end

  private
  def make_guess
    puts 'Enter your guess as a comma separated list(e.g: red, blue, cyan, magenta): '
    loop { 
    guess = gets.chomp.split.join.split(',').map(&:to_sym)
    return guess if check_guess(guess)
    puts 'That\'s not a valid guess, try again, and remember the example: '
    }
  end

  def check_guess(guess)
    # Should check if all the colors inside the array of guess are available on the array of COLORS
  end
end

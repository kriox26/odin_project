# Class for a human player, ai player is child of this class
class Player
  attr_accessor :score, :name
  def initialize
    print 'Player name: '
    @name = gets.chomp
    @score = 0
  end

  def make_guess
    puts 'Enter your guess as a comma separated list(e.g: red, blue, cyan, magenta): '
    loop do
      guess = gets.chomp.split.join.split(',').map(&:to_sym)
      return guess if check_code(guess)
      puts 'That\'s not a valid guess, try again, and remember the example: '
    end
  end

  def human?
    true
  end

  def ai?
    false
  end

  def update_score(score)
    @score += score
  end
end

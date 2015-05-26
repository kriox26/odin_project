class Mastermind
  def initialize
    initialize_game
  end

  def play
    loop { 
      play_game
      break unless again?
    }
  end

  private
  def initialize_game
    # codemaker is the computer, generate random code
    @secret_code = generate_secret_code
    @codebreaker = Player.new()
    @board = Board.new
    @moves = 0
  end

  def play_game
    decipher = false
    while !decipher && @moves<=12
      guess = @codebreaker.make_guess
      score, decipher = check_correctness(guess)
      @board.update_board(guess,score, @moves)
      @moves += 1
    end
  end

  def generate_secret_code
    secret_code = Array.new(4)
    secret_code.length().times do |index|
      # Generate each color of the secret code 
      secret_code[index] = 1 + rand(6)
    end
    return secret_code
  end

end

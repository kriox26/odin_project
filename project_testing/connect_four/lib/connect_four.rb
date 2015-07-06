class ConnectFour
  PLAYERS = [:green , :yellow]

  attr_reader :current_player, :board

  def initialize
	@board = Board.new
	@current_player = PLAYERS.first
  end

  def start
	puts "Welcome to Connect Four game!"
  end

  def get_move
	loop do
	  move = user_input
	  return (move.to_i - 1) if correct_input?(move)
	end
  end

  def user_input
	loop do
	  input = gets.chomp
	  return input if !input.empty?
	end
  end

  def correct_input?(inp)
	inpx = inp.to_i
	return true if inpx.between?(1,Board::COLS)
	false
  end

  def switch_player
	@current_player = @current_player == PLAYERS.first ? PLAYERS.last : PLAYERS.first
  end

end

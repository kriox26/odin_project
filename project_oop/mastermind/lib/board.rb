# contains two boards, the decoding board and the score board with the rates of each guess
class Board
  attr_reader :guess_board, :score_board
  def initialize
	create_boards
  end

  def print_screen(is_ai,code,ai_name)
	print_top_message(is_ai,ai_name)
	self.print_boards(code, is_ai)
  end

  def update_board(guess, score, move)
	@guess_board[move] = guess
	@score_board[move] = score
  end

  private
	def create_boards
	  # initialize boards with default color, meaning no color
	  @guess_board = Array.new(12){ Array.new(4,:default) }
	  @score_board = Array.new(12){ Array.new(4,:default) }
	end

  protected
	def print_boards(code,ai_playing)
	  print_top_lines
	  print_center_boards
	  if ai_playing
		print_secret_code(code)
	  end
	end

end

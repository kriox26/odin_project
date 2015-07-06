class Board
  ROWS = 6 # ROWS = x
  COLS = 7 # COLS = y

  attr_accessor :board

  def initialize
	@board = Array.new(6)  { Array.new(7, '  ') }
  end

  def clean_board
	if !(@board.count('  ') == @board.size)
	  @board.map! { |elem| elem = '  ' }
	end
  end

end

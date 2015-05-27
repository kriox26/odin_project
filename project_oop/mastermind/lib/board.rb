# Has two boards, the board with all guesses and the bord with the score of those guesses
class Board
  attr_reader :guess_board, :score_board
  def initialize(*args)
    create_boards
  end

  def print_boards(code,ai_playing)
    print_top_lines
    print_center_boards
    if ai_playing
      print_secret_code(code)
    end
  end

  def update_board(guess, score, move)
    @guess_board[move] = guess
    @score_board[move] = score
  end

  private
  def create_boards
    @guess_board = Array.new(12){ Array.new(4) }
    @guess_board.each do |element|
      element.each do |color|
        color = :default
      end
    end
    @score_board = Array.new(12){ Array.new(4) }
    @score_board.each do |element|
      element.each do |color|
        color = :default
      end
    end
  end
  def print_top_lines
    print "\t\t"
    print SPLIT[:nw_corner]
    4.times do |i|
      5.times do
	print SPLIT[:horizontal]
      end
      if i == 3
	print SPLIT[:ne_corner]
      else
	print SPLIT[:n_divide]
      end
    end
    print '  '
    print SPLIT[:nw_corner]
    4.times do |i|
      2.times do
	print SPLIT[:horizontal]
      end
      if i == 3
	print SPLIT[:ne_corner]
      else
	print SPLIT[:n_divide]
      end
    end
    puts
  end

  def print_center_boards
    12.times do |i|
      print "\t\t"
      print SPLIT[:vertical]
      4.times do |j|
	print ' '
	print '   '.colorize(:background => @guess_board[i][j])
	print ' '
	print SPLIT[:vertical]
      end
      print '  '
      print SPLIT[:vertical]
      4.times do |k|
	print '  '.colorize(:background => @score_board[i][k])
	print SPLIT[:vertical]
      end
      puts
      if i==11
        print_bottom_lines
      else
	print_middle_lines
      end
      puts
    end
  end

  def print_middle_lines
    print "\t\t"
    print SPLIT[:w_divide]
    4.times do |i|
      5.times do
	print SPLIT[:horizontal]
      end
      if i==3
        print SPLIT[:e_divide]
      else
        print SPLIT[:cross]
      end
    end
    print '  '
    print SPLIT[:w_divide]
    4.times do |i|
      2.times do
        print SPLIT[:horizontal]
      end
      if i==3
        print SPLIT[:e_divide]
      else
        print SPLIT[:cross]
      end
    end
  end

  def print_bottom_lines
    print "\t\t"
    print SPLIT[:sw_corner]
    4.times do |k|
      5.times do
	print SPLIT[:horizontal]
      end
      if k==3
	print SPLIT[:se_corner]
      else
	print SPLIT[:s_divide]
      end
    end
    print '  '
    print SPLIT[:sw_corner]
    4.times do |l|
      2.times do
	print SPLIT[:horizontal]
      end
      if l==3
	print SPLIT[:se_corner]
      else
	print SPLIT[:s_divide]
      end
    end
  end
end

class TicTacToe
  attr_accessor :player1 , :player2
  WELCOME = <<-END.gsub(/^\s+\|/, '')
   |
   +---+---+---+
   | 1 | 2 | 3 |  This is the board used to play tic tac toe, the positions are
   |---+---+---+  represented by the numbers 1 - 9 as shown in the
   | 4 | 5 | 6 |  figure at the left.
   |---+---+---+  To place an 'X' or 'O' in a certain position, simply
   | 7 | 8 | 9 |  enter the number corresponding to that position.
   +---+---+---+
   |
  END
  def initialize
  end

  def create_grid_and_players
	puts "Welcome to Tic Tac Toe!"
	# game board
	@board = Array.new(10,' ')
	@player1 = Player.new("X")
	@player2 = Player.new("O")
	@result = ''
	@moves = 0
  end

  def play
	while true
	  # run the game
	  create_grid_and_players
	  play_game
	  # if the answer is Y, the loop will continue executing
	  break unless again?
	end
  end

  def play_game
	puts WELCOME
	# execute the while until a draw or someone wins
	loop do
	  @board[get_move(@board)] = 'O'
	  @moves += 1
	  # check in case player 1 made the winning move
	  if @moves >= 5
		break if winner?(@board)
	  end
	  print_board_to_screen(@board)
	  @board[get_move(@board)] = 'X'
	  @moves += 1
	  # check in case player 2 made the winning move
	  if @moves >= 5
		break if winner?(@board)
	  end
	  print_board_to_screen(@board)
	end
	end_of_game(@board)
  end

  def print_board_to_screen(board)
	print_board = <<-ACTUALBOARD
   +---+---+---+
   | #{ board[1] } | #{ board[2] } | #{ board[3] } |
   |---+---+---|
   | #{ board[4] } | #{ board[5] } | #{ board[6] } |
   |---+---+---|
   | #{ board[7] } | #{ board[8] } | #{ board[9] } |
   +---+---+---+
	ACTUALBOARD
	puts print_board
  end

  def winner?(board)
	if @moves >= 9
	  # when is in here means that all cells of the board are complete, and nobody won
	  @result = 'draw'
	  return true
	else
	  # load a hash of all wining scenarios
	  posibilities = { 1=>[1,3,4] , 2=>[3] , 3=>[2,3] , 4=>[1] , 7=>[1] }
	  posibilities.each do |index, values|
		# if check_posibilities returns false, keep going, else break
		return true if check_posibilities(board, index, values)
	  end
	end
	return false
  end

=begin
   This method checks for 3 adyacent cells of the same mark.
   for example, if cell 1, 5 and 9 have the same mark, let's say X
   then the player with mark X will win the game
=end
  def check_posibilities(board, position, posibilities)
	posibilities.each do |i|
	  if board[position]!=' ' && board[position] == board[position + i] && board[position] == board[position + i + i]
		# in case we have a winner, set @result = winner
		update_winner(board[position])
		return true
	  end
	end
	return false
  end

  def update_winner(mark_of_winner)
	# Player 1 = X and player 2 = O, we update the winner
	@result = mark_of_winner == 'X'?'Player 1':'Player 2'
  end

  def end_of_game(board)
	print_board_to_screen(board)
	case @result
	when 'draw'
	  puts "It's a draw!"
	when 'Player 1'
	  puts "Player 1(X) is the winner!"
	when 'Player 2'
	  puts "Player 2(O) is the winner!"
	else
	  puts "There is something broken here........."
	end
  end

  def again?
	while true
	  print "Do you want to play again(y/n)? "
	  choice = STDIN.gets.chomp
	  case choice
	  when 'y'
		create_grid_and_players
		return true
	  when 'n'
		return false
	  else
		puts "That's not a valid answer!!"
	  end
	end
  end

  def get_move(player)
	return player.get_move(@board)
  end
end


class Player
  # I'll only need to read his mark, no need to change it
  attr_reader :mark
  def initialize(mark)
	@mark = mark
  end

  def get_move(board)
	loop do
	  position = STDIN.gets.chomp.to_i
	  if board[position] == ' ' && position != 0
		return position
	  end
	end
  end
end
# ttt = TicTacToe.new
# ttt.play

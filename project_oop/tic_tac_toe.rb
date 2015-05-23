class Game
  @@welcome = <<-END.gsub(/^\s+\|/, '')
   |
   | 1 | 2 | 3   The positions to play on the tic-tac-toe board are
   |---+---+---  represented by the numbers 1 - 9 as shown in the
   | 4 | 5 | 6   figure at the left.
   |---+---+---  To place an 'X' or 'O' in a certain position, simply
   | 7 | 8 | 9   enter the number corresponding to that position.
   |
   |
  END
  def initialize()
    create_grid_and_players
  end

  def create_grid_and_players
    @board = [' ',' ',' ',' ',' ',' ',' ',' ',' ', ' ']
    print 'Name of player 1(mark= X): '
    name = gets.chomp
    @player1 = Player.new(name,"X")
    print 'Name of player 2(mark= O): '
    name = gets.chomp
    @player2 = Player.new(name,"O")
    @result = ''
    @moves = 0
  end

  def print_board_to_screen(board)
    print_board = <<-ACTUALBOARD
   |
   | #{ board[1] } | #{ board[2] } | #{ board[3] }  
   |---+---+---
   | #{ board[4] } | #{ board[5] } | #{ board[6] } 
   |---+---+---
   | #{ board[7] } | #{ board[8] } | #{ board[9] }
   |
   |
    ACTUALBOARD
    puts print_board 
  end

  def play
    while true
      play_game
      break unless again?
    end
  end
  private
  def play_game
    display_welcome_message
    while !winner?(@board)
      @board = @player1.make_move(@board)
      @moves += 1
      break if winner?(@board)
      print_board_to_screen(@board)
      @board = @player2.make_move(@board)
      @moves += 1
      break if winner?(@board)
      print_board_to_screen(@board)
    end
    end_of_game(@board)
  end

  def display_welcome_message
    puts @@welcome
  end

  def winner?(board)
    if @moves >= 9
      @result = 'draw'
      return true
    else
      if @moves >= 5
	posibilities = { 1=>[1,3,4] , 2=>[3] , 3=>[2,3] , 4=>[1] , 7=>[1] }
	posibilities.each do |index, values|
	  # if check_posibilities returns false, keep going, else break
	  return true if check_posibilities(board, index, values)
	end
      end
    end
    return false
  end

  def check_posibilities(board, position, posibilities)
    posibilities.each do |i|
      # check if each position of the different adds are equal
      if board[position]!=' ' && board[position] == board[position + i] && board[position] == board[position + i + i]
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
      puts "The winner is: " + @player1.name + ". Congratulations!!!"
    when 'Player 2'
      puts "The winner is: " + @player2.name + ". Congratulations!!!"
    else
      puts "There is something broken here........."
    end
  end

  def again?
    while true
      print "Do you want to play again(y/n)? "
      choice = gets.chomp
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
end


class Player
  # I'll only need to read his mark, no need to change it
  attr_reader :name, :mark
  # We will get and set if he or she is a winner or losser
  def initialize(name, mark)
    @name = name
    @mark = mark
  end

  def make_move(board)
    x = get_move(board)
    board[x]=self.mark
    return board
  end

  private
  def get_move(board)
    print self.name + ", input position to"
    while true
      print ' mark: '
      position = gets.chomp.to_i
      return position if board[position] == ' '
      print 'Try again, position to'
    end
  end
end


game = Game.new()
game.play

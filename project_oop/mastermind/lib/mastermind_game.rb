class MastermindGame
  attr_accessor :current_player
  def initialize
    initialize_game
  end

  def play
    loop do
      play_game
      break unless again?
    end
  end

  private
  def initialize_game
    system "clear"
    puts WELCOME_MESSAGE
    # Generate secret code
    initialize_players_and_code
    loop do
      # The number of rounds must be even, (2,4,6,8,etc)
      print "How many rounds do you want to play(must be an even number)? "
      @round = gets.chomp.to_i
      if @round.is_a? Integer 
	if @round % 2 == 0 && @round != 0
	  break
	end
      end
    end
	message_until_enter("Press enter to begin playing!")
  end

  def initialize_players_and_code
    @ai_player = PlayerAI.new
    @human_player = Player.new
    # The human player starts ALWAYS as the codebreaker
    @current_player = @human_player
    initialize_board_and_code(@current_player.ai?)
    puts "Hey #{ @current_player.name }, it seems you will be playing against #{ @ai_player.name }. So... good luck i guess!"
  end

  def initialize_board_and_code(is_ai)
    if is_ai
      @secret_code = input_secret_code(@human_player.name)
      @current_player.reset_values
    else
      @secret_code = generate_secret_code
    end
    @board = Board.new
  end

  def play_game
    while @round != 0
      # decipher will be true only if the player has decipher the code
      decipher = false
      # for keeping track were to put the guess in the guess board
      @move = 0
      while @move <12 && !decipher
	# top messages are different for human players
	print_top_message(@current_player.ai?,@ai_player.name)
	# if the current_player(codebreaker) is an ai, the board will also show the secret code
	@board.print_boards(@secret_code, @current_player.ai?)
	# make_guess handles if it is an ai or a human player 
	guess = @current_player.make_guess
	message_until_enter("Press enter to rate guess")
	# rate_guess returns the score of current guess and if the guess is equal to the secret code or not
	rating, decipher = rate_guess(guess,@secret_code)
	if @current_player.ai?
	  # update the last rating
	  @current_player.update_rating(rating)
	  # remove from possible codes any code that would not give the same response as if it(the guess) would be the secret code
	  @current_player.update_set_of_codes 
	end
	# update the board of current round
	@board.update_board(guess,rating,@move)
	@move += 1
      end
      # each player has his/her own score
      print_top_message(@current_player.ai?,@ai_player.name)
      # if the current_player(codebreaker) is an ai, the board will also show the secret code
      @board.print_boards(@secret_code, @current_player.ai?)
      @current_player.update_score(@move)
      print_score_of_player(decipher)
      # change from human player to ai or from ai to human player
      update_current_player
      # resets the board because the next round starts
      @round -= 1
    end
    end_of_game
  end

  # change from human player to ai or from ai to human player
  def update_current_player
    @current_player = (@current_player == @human_player)? @ai_player : @human_player
    initialize_board_and_code(@current_player.ai?)
  end

  def print_score_of_player(decipher)
    if !decipher
      puts "Too bad, the code was: "
      puts
      print_secret_code(@secret_code)
    end
    puts "End of round. Score of #{ @current_player.name } is: #{ @move }"
	message_until_enter("Press enter to continue")
  end

  def end_of_game
    system "clear"
    puts "#{ @human_player.name } score: #{ @human_player.score }"
    puts "#{ @ai_player.name } score: #{ @ai_player.score }"
    if @ai_player.score < @human_player.score
      puts "Sorry you lost! you were #{ @human_player.score - @ai_player.score } point/s close!"
    else
      if @ai_player.score == @human_player.score
	puts "It's a draw!!!'"
      else
	puts "Congratulions!!! You've just defeated #{ @ai_player.name }' by #{ @ai_player.score - @human_player.score } point/s!"
      end
    end
  end

  def again?
	loop do
	  print "Do you want to play again?(y/n): "
	  response = gets.chomp
	  case response
	  when "y","yes"
		initialize_game
		return true
	  when "n","no"
		return false
	  else
		puts "That's not a valid answer, try again!".colorize(:color=>:light_red)
	  end
	end
  end
end

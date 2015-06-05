class Hangman
  attr_accessor :player_name, :player_lives
  def initialize
	menu
  end

  private
  def display_menu
	system("clear")
    puts "For now, only play, input 1: "
  end
  def menu
    # Should display the menu with: play new game, load game and quit, then ask you that you wanna do
	loop do
	  display_menu
	  choice = gets.chomp
	  case choice
	  when "1"
		play_game
		break
	  when "2"
		load_game
		break
	  when "3"
		quit_game
		break
	  else
		puts "Invalid answer, try again."
	  end
	end
  end

  def play_game
	# ask for players name . Generate secret word
	# play while the player doesn't guess the word or he/she still has lives
	print "Player name: "
	@name = gets.chomp
	@figure = HangmanDisplay.new
	generate_secret_word
	play
  end

  def play
	moves = 0
	while moves < 11
	  @figure.display_game_board(@right_chars,@wrong_chars, moves)
	  break if make_and_rate
	  moves += 1
	end
	if moves == 11
	  puts "Sorry, you lost! The word was: "
	  puts @secret_word
	else
	  @figure.display_game_board(@right_chars,@wrong_chars, moves)
	  puts "Great job!"
	end
  end

  def generate_secret_word
	# take a sample from the array with each word of the dictionary
	loop do
	  @secret_word = File.readlines("dictionary.txt").sample.split(//)
	  break if @secret_word.length > 4 && @secret_word.length < 11
	end
	@right_chars = Array.new((@secret_word.length-1), "_")
	@wrong_chars = []
	@secret_word.delete_at(@secret_word.length-1)
	p @secret_word
	return @secret_word
  end

  def make_and_rate
	# the user can input a word or a char, if input is larger that one it's a word, else it's a char
	puts "You can guess with a single character or with a word, if you guess the right word you win, if not you'll lose a life and keep playing. And remember, it's case sensitive"
	print "Word or char: "
	guess = gets.chomp
	if guess.length > 1
	  return check_word(guess)
	else
	  return check_char(guess)
	end
  end

  def check_word(word)
	word.split(//) == @secret_word
  end

  def check_char(char)
	if @secret_word.include?(char) 
	  if !@right_chars.include?(char)
		update_corrects(char)
	  end
	else
	  if !@wrong_chars.include?(char)
		update_wrongs(char)
	  end
	end
	@secret_word == @right_chars
  end

  def update_corrects(char)
	index = []
	@secret_word.each_with_index do |car,i|
	  index << i if car == char
	end
	index.each do |i|
	  @right_chars[i] = char
	end
  end

  def update_wrongs(char)
	@wrong_chars << char
  end

end

module Mastermind
  # Define constants
  AI_NAMES = [ "HAL 9000", "T-1000", "R2-D2", "Optimus Prime", "Agent Smith", "Wall-E", "Skynet"]

  COLORS = [:blue, :red, :cyan, :yellow, :green, :magenta]

  SPLIT = { vertical:  "\u2551", horizontal: "\u2550", cross:     "\u256c",
	    nw_corner: "\u2554", ne_corner:  "\u2557", se_corner: "\u255d",
	    sw_corner: "\u255a", n_divide:   "\u2566", s_divide:  "\u2569",
	    e_divide:  "\u2563", w_divide:   "\u2560" }

  WELCOME_MESSAGE = <<-WELCOME
  Hello there! Mastermind is a two players game, in this game you will be playing against some famous AI!(like Skynet). You first decide 
  how many rounds you wanna play(it must be an even number). One player becomes the codemaker, the other the codebreaker. The codemaker 
  chooses a pattern of four code pegs. Duplicates are allowed, so the player could even choose four code pegs of the same color. The 
  chosen pattern is placed in the four holes covered by the shield, visible to the codemaker but not to the codebreaker. The codebreaker 
  may have a very hard time finding out the code.
  The codebreaker tries to guess the pattern, in both order and color, within twelve turns. Each guess is made by placing a row of code 
  pegs on the decoding board. Once placed, the codemaker provides feedback by placing from zero to four key pegs in the small holes of 
  the row with the guess. A colored or black key peg is placed for each code peg from the guess which is correct in both color and position. 
  A white key peg indicates the existence of a correct color code peg placed in the wrong position.
  Now let's play Mastermind!!
  WELCOME

  def print_top_message(is_ai)
    system "clear"
    puts "\t\t\t\tMastermind Game".colorize(:color=>:light_white,:background=>:light_magenta)
    puts
    if is_ai
      puts "The AI is playing!"
    else
      puts "You are playing!"
      puts "Colors available: #{'       '.colorize(:background=>COLORS[0])}#{ '       '.colorize(:background=>COLORS[1])}#{ '       '.colorize(:background=>COLORS[2]) }#{ '       '.colorize(:background=>COLORS[3]) }#{ '       '.colorize(:background=>COLORS[4]) }#{ '       '.colorize(:background=>COLORS[5]) }"
      puts "Choose with:        blue   red    cyan  yellow green magenta"
    end
    puts
    puts "\t\t       #{ 'Guess board'.colorize(:light_red) }\t    #{ 'Score board'.colorize(:light_red) }"
  end

  def generate_secret_code
    secret_code = [COLORS[rand(6)], COLORS[rand(6)], COLORS[rand(6)], COLORS[rand(6)]]
    return secret_code
  end

  def input_secret_code(name)
    print_top_message(false)
    puts "Hey #{ name }. Enter secret code as a comma separated list(e.g: red, blue, cyan, magenta): "
    loop do
      secret_code = gets.chomp.split.join.split(',').map(&:to_sym)
      return secret_code if check_code(secret_code)
      puts 'That\'s not a valid code, try again, and remember the example: '
    end
  end

  def check_code(code)
    # Checks if each color in guess is available in COLORS
    code.each do |element|
      return false if !(COLORS.include?(element))
    end
    return true
  end

  def rate_guess(guess,secret_code,from_ai=false)
    i=0
    score = []
    # for keeping tracks of whites
    guess_no_match = Array.new()
    secret_no_match = Array.new()
    guess.each_with_index do |color,index|
      if secret_code[index] == color
	# Right color in right position
	score[i]=:black
	i+=1
      else
	guess_no_match << color
	secret_no_match << secret_code[index]
      end
    end
    guess_no_match.each do |color|
      nodp = secret_no_match.index(color)
      unless nodp.nil?
	secret_no_match.delete_at(nodp)
	score[i]=:white
	i+=1
      end
    end
    if !from_ai
      return score,secret_code==guess
    else
      return score
    end
  end

  def print_secret_code(code)
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
    puts
    print "\t\t"
    print SPLIT[:vertical]
    4.times do |j|
      print ' '
      print '   '.colorize(:background => code[j])
      print ' '
      print SPLIT[:vertical]
    end
    puts
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
    puts
  end

  # use this when updating last_rating of ai player
  def number_of_wb(array)
    whites = 0
    blacks = 0
    array.each do |element|
      if element == :black
        blacks+=1
      else
	if element == :white
	  whites+=1
	end
      end
    end
    return [whites,blacks]
  end

end

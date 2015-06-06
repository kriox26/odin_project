class HangmanDisplay
  def initialize
	@hanging = Array.new(14," ")
  end

  def display_game_board(right_chars, wrong_chars)
	update_dead_man(wrong_chars.length)
	system("clear")
	puts "\t" + "Hangman".colorize(:color => :light_white , :background => :light_magenta)
	display_figure
	display_bottom
	display_table(right_chars,wrong_chars)
  end

  private
  def update_dead_man(size)
	for i in 0..(size - 1)
	  @hanging[i] = PIECES[i]
	end
  end
  def display_figure
	puts "\t #{@hanging[3]}#{@hanging[4]}#{@hanging[5]}#{@hanging[6]}#{@hanging[7]}"
    puts "\t#{@hanging[2]}    #{@hanging[8]}"
	puts "\t#{@hanging[1]}   #{@hanging[9]}#{@hanging[10]}#{@hanging[11]}"
	puts "\t#{@hanging[0]}   #{@hanging[12]} #{@hanging[13]}"
  end
  def display_bottom
    puts "\t#{SEPARATORS[:bottom]}"
  end
  def display_table(right_chars,wrong_chars)
	# display table with information, moves remaining are @hanging.length - wrong_chars.length
	print "Right guesses:".colorize(:green)  
	display(right_chars){ |elem| print " #{elem}" }
	puts
	print "Wrong guesses:".colorize(:red) 
	display(wrong_chars){|elem| print " #{elem}"}
	puts
	print "Moves remaining:".colorize(:blue)
	print " #{(14 - wrong_chars.length)}"
	puts
  end
end

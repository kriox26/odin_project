class HangmanDisplay
  PIECES = ["☹" , "╱" ,"╿" , "╲" , "╱" , "╲" ]
  SEPARATORS = { vertical: "⎹", top:"ᒥ⎺⎺⎺ᒣ" , bottom:"ーー"  }

  def initialize
	@hanging = Array.new(6," ")
  end

  def display_game_board(right_chars, wrong_chars, moves)
	if (10 - wrong_chars.length) <= 6
	  update_dead_man((wrong_chars.length - 4))
	end
	system("clear")
	puts "\t" + "Hangman".colorize(:color => :light_white , :background => :light_magenta)
	display_top_line
	display_center
	display_bottom
	display_table(right_chars,wrong_chars, moves)
  end

  def update_dead_man(size)
	for i in 0..(size - 1)
	  @hanging[i] = PIECES[i]
	end
  end
  
  def display_top_line
    puts "\t #{SEPARATORS[:top]}"
  end
  def display_center
    puts "\t#{SEPARATORS[:vertical]}    #{@hanging[0]}"
	puts "\t#{SEPARATORS[:vertical]}   #{@hanging[1]}#{@hanging[2]}#{@hanging[3]}"
	puts "\t#{SEPARATORS[:vertical]}   #{@hanging[4]} #{@hanging[5]}"
  end
  def display_bottom
    puts "\t#{SEPARATORS[:bottom]}"
  end
  def display(some_array)
	some_array.each do |elem|
	  print " #{elem}"
	end
  end
  def display_table(right_chars,wrong_chars, moves)
	# display table with information, moves remaining are @hanging.length - wrong_chars.length
	print "Word completion:".colorize(:green)  
	display(right_chars)
	puts
	print "Wrong guesses:".colorize(:red) 
	display(wrong_chars)
	puts
	print "Moves remaining: " 
	print (10 - moves)
	puts
  end
end

class Game

  def play
	loop do
	  play_game
	  break unless again?
	end
  end

  protected
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

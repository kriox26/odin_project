module HangmanGame
  PIECES = ["⎹" , "⎹" , "⎹" , "ᒥ" , "⎺" , "⎺" , "⎺" , "ᒣ" , "☹" , "╱" ,"╿" , "╲" , "╱" , "╲" ]
  SEPARATORS = { bottom:"‾‾‾‾" , bottom2:"ーー"  }
  
  MENU_MESSAGE = <<-MENU
Hey there, here is what you need to know about this particular Hagnman!
When the game starts, you will be prompt with a menu, where you can choose one of three options.
If you choose option 1(play game), the game will first pick a random word as the secret word, your job
is to try and guess that word in less than 14 moves, if not you will be hanged!!
In case you decide to load game, a list of all saved games will appear, you then have to choose one of those
and you will return to state of that game.
Have fun!

  MENU
  INPUT_MESSAGE = <<-INPUT
These are the options you have:
  #{'*'.colorize(:light_blue)} Type a word or character(case sensitive), if the word is correct, the game ends, if the character is correct right guesses is updated. Else you lose a life.
  #{'*'.colorize(:light_blue)} If you want to save the game and then quit type: save
  #{'*'.colorize(:light_blue)} If you want to quit without saving type: quit

  INPUT

  def display(some_array)
	some_array.each do |elem|
	  yield(elem)
	end
  end

  def is_letter?(char)
    char =~ /[A-Za-z]/
  end

  def check_input(input)
	if input.length == 1
	  return true if is_letter?(input)
	else
	  return true if input[/[a-zA-Z]+/] == input
	end
	puts "Wrong input, it must be a letter or a word with only letters. Try again".colorize(:red)
	return false
  end

  def get_name_to_save
	name = player_name + ".yml"
	loop do
	  break if !File.exists?(name)
	  name = player_name + rand(100).to_s + ".yml"
	end
	return name
  end

  def get_games_available
	games = Dir["./*.yml"] 
	if games != []
	  games.collect! do |elem|
		elem.gsub!(/\.\//, '')
		elem.gsub!(/\.yml/, '')
	  end
	end
	return games
  end

  def name_message(message)
    print message
	name = gets.chomp
	name = name + ".yml"
	return name
  end

  def delete(name)
	File.delete(name)
  end

  def quit_game
	puts "Bye!!".colorize(:magenta)
	exit
  end
end


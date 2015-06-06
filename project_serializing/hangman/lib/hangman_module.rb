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

  def display(some_array)
	some_array.each do |elem|
	  yield(elem)
	end
  end

  def is_letter?(char)
    char =~ /[A-Za-z]/
  end
end


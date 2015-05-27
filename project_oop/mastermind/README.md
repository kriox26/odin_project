# Mastermind

You should run the game like this: `$ ruby mastermind.rb`

### Game play

Refactor [Wikipedia-Mastermind](http://en.wikipedia.org/wiki/Mastermind_%28board_game%29) explanation: Mastermind is a two players game, in this game you will be playing against some famous AI!(like Skynet). You first decide how many rounds you want to play(it must be an even number). One player becomes the codemaker, the other the codebreaker. The codemaker chooses a pattern of four code pegs. Duplicates are allowed, so the player could even choose four code pegs of the same color. The chosen pattern is placed in the four holes covered by the shield, visible to the codemaker but not to the codebreaker. The codebreaker may have a very hard time finding out the code.
The codebreaker tries to guess the pattern, in both order and color, within twelve turns. Each guess is made by placing a row of code 
pegs on the decoding board. Once placed, the codemaker provides feedback by placing from zero to four key pegs in the small holes of 
the row with the guess. A colored or black key peg is placed for each code peg from the guess which is correct in both color and position. 
A white key peg indicates the existence of a correct color code peg placed in the wrong position.

Here are a few screenshot of a game between a human player and the AI:
![human playing](https://github.com/kriox26/odin_project/blob/master/project_oop/mastermind/imgs/human_playing.png)
![ai playing](https://github.com/kriox26/odin_project/blob/master/project_oop/mastermind/imgs/ai_playing.png)
![end of the game](https://github.com/kriox26/odin_project/blob/master/project_oop/mastermind/imgs/end_of_game.png)

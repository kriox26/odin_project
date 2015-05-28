# Mastermind

To start playing run this command on the home directory of the project: `$ ruby mastermind.rb`

### Game play

[Wikipedia-Mastermind](http://en.wikipedia.org/wiki/Mastermind_%28board_game%29) explanation: Mastermind is a two players game, in this game you will be playing against some famous AI!(like Skynet). You first decide how many rounds you want to play(it must be an even number). One player becomes the codemaker, the other the codebreaker. The codemaker chooses a pattern of four code pegs. Duplicates are allowed, so the player could even choose four code pegs of the same color. The chosen pattern is placed in the four holes covered by the shield, visible to the codemaker but not to the codebreaker. The codebreaker may have a very hard time finding out the code.
The codebreaker tries to guess the pattern, in both order and color, within twelve turns. Each guess is made by placing a row of code 
pegs on the decoding board. Once placed, the codemaker provides feedback by placing from zero to four key pegs in the small holes of 
the row with the guess. A colored or black key peg is placed for each code peg from the guess which is correct in both color and position. 
A white key peg indicates the existence of a correct color code peg placed in the wrong position.

Here are a few screenshot of a game between a human player and the AI:
![human playing](https://github.com/kriox26/odin_project/blob/master/project_oop/mastermind/imgs/human_playing.png)
![ai playing](https://github.com/kriox26/odin_project/blob/master/project_oop/mastermind/imgs/ai_playing.png)
![end of the game](https://github.com/kriox26/odin_project/blob/master/project_oop/mastermind/imgs/end_of_game.png)


### About the AI

The AI you will play against use a slightly different implementation of [Donald Knuth five-guess algorithm](http://en.wikipedia.org/wiki/Mastermind_%28board_game%29#Five-guess_algorithm).
I've change the sixth step because it's computationally expensive. Here is the algorithm: 
```
1. Create the set of 1296 possible codes. We have six colors that can be distributed in 4 positions, so it's 6^4=1296 possible permutations.(allowing duplicates)
2. Start with an initial guess like RED,RED,BLUE,BLUE. Only two colors, there are some cases where if you choose more thant 2 colors, you won't win the game in less than five moves.
3. Play the guess to get a response.
4. In case the response is four black pegs, you won the game. Otherwise continue to step 5
5. Remove from S any code that would not give the same result if it(the guess) would be the secret code.
6. Choose a random sample from the remaining codes of the set S.
7. Repeat from step 3.
```

That's it, have fun!!

#  Project - OOP

Couple of fun programming problems, build using Ruby and the concepts of OOP(Object oriented programming), from [The Odin Project - Ruby Course - Projects: OOP](http://www.theodinproject.com/ruby-programming/oop).

## Tic Tac Toe

You should run the game like this: `$ ruby tic_tac_toe.rb `

### Game play

When the game starts, it'll ask you for the name of the two players, player number 1 will have the mark X and player number two the mark O.
Then, the welcome message will appear: 
```
Name of player 1(mark= X): Agustin
Name of player 2(mark= O): Matias
|
| 1 | 2 | 3   This is the board used to play tic tac toe, the positions are
|---+---+---  represented by the numbers 1 - 9 as shown in the
| 4 | 5 | 6   figure at the left.
|---+---+---  To place an 'X' or 'O' in a certain position, simply
| 7 | 8 | 9   enter the number corresponding to that position.
|
|
```

Here is a sample output for the first two moves:
```
Agustin, input position to mark: 5
   |
   |   |   |
   |---+---+---
   |   | X |
   |---+---+---
   |   |   |
   |
   |
Matias, input position to mark: 1
   |
   | O |   |
   |---+---+---
   |   | X |
   |---+---+---
   |   |   |
   |
   |
```

Once you finish, it'll tell you if it was a draw, or the name of the winner. And ask you if you wanna play again, like this:
```
Matias, position to mark: 4
   |
   | O |   | X
   |---+---+---
   | O | X | X
   |---+---+---
   | O |   |
   |
   |
The winner is: Matias. Congratulations!!!
Do you want to play again(y/n)?
```

Have fun!!!

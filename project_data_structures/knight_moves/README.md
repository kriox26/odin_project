[Knight Moves - TOP](http://www.theodinproject.com/ruby-programming/data-structures-and-algorithms)
======================

From The Odin Project:
```
Your task is to build a function knight_moves that shows the simplest possible way to
get from one square to another by outputting all squares the knight will stop on along
the way.
```

#### Implementation
To build knight moves I first implemented a Square class that will hold the positions `x` and `y` of a block.
A Square also has a `parent_node` and `children`. `parent_node` has the previous position on the board, and `children`
has all possible positions we could end up from there. Each attribute of Square has a Get method:
```ruby
class Square
  attr_reader :pos_x, :pos_y, :parent_node, :children
```

###### Square methods

* `#possible_paths`, will set the `children` attribute of the current square and return an array of right moves to make.
* `#get_codes` returns an array of all possible moves we can make, including the ones that are wrong.

###### Script functions

* `#get_general_tree(from, to)` creates a general tree, where each node has an `x` and `y` position, a `parent node` that is
the previous position, and a `children` array of all possible positions we could end up if we decide to move.
* `#knight_moves(root,destination)` calls to `#get_general_tree(from,to)` to create a tree of `Squares`, then it searches for the
path the knight has to follow in order to go from `root` to `destination`.

Output:
```ruby
> knight_moves([5,6],[2,7])
Found it in 2 steps! Your path was:
[5, 6]
[3, 5]
[2, 7]
```

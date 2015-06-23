## [Data Structures and Algorithms](http://www.theodinproject.com/ruby-programming/data-structures-and-algorithms)

This is my implementation of a [Binary Search Tree](https://en.wikipedia.org/wiki/Binary_search_tree) using ruby. To run the program type this in the main directory: `$ ruby bst.rb`.
When you run it, the following menu will be prompt: 
```

```
You can then choose any of those options.

#### About the implementation

###### Inside bst.rb

* `#create_tree`: Builds a tree(stored by default) calling the `#build_tree` method of `class BST`, and then starts the interactive program.
* `#dfs(x)`: Search the `x` value inside the tree using the [Depth First Search](https://en.wikipedia.org/wiki/Depth-first_search) algorithm.
* `#bfs(x)`: Search the `x` value inside the tree using the [Breadth First Search](https://en.wikipedia.org/wiki/Breadth-first_search) algorithm.
* `#dfs_rec(x)`: Search the `x` value inside the tree using a Recursive Search algorithm.
* `#display_in_order`: In order display of each node inside the Binary Search Tree.

###### Inside node.rb

Inside this file is the implementation of the Node class that the BST uses.
# Building Blocks

Basic programming problems to solve in ruby, from [Projects: Building Blocks](http://www.theodinproject.com/ruby-programming/building-blocks).


### Caesar cipher

You should run something like this:  `ruby caesar_cipher.rb 5`

* `#caesar_cipher` shifts each char of a string KEY positions, the key is given as a command line argument


### Stock picker

You should run this: `ruby stock_picker.rb`

* It will first ask you for the number of days, then the price that corresponds to each day. Finally it does a bit of magic and returns the best scenario where you first buy and then sell.


### Substrings

Run this: `ruby substrings.rb`

* `#substrings(substr, dictionary)` It takes a word as the first argument and then an array of valid substrings as the second argument. It thens returns a hash listing each substring that was found in the original string and how many times it was found.



# Advanced Building Blocks

A couple of more advanced(but still basic) programming problems, from [Projects: Advanced Building Blocks](http://www.theodinproject.com/ruby-programming/advanced-building-blocks).


### Bubble Sort

You should run something like this: `ruby bubble_sort.rb`

* `#bubble_sort(array_to_sort)` Takes an array as an argument and returns a sorted array(ascending order).
* `#bubble_sort_by(array_to_sort)` Sorts an array but accepting a block. The block should take two arguments which represent the two elements currently being compared. Expect that the block's return will be similar to the spaceship operator you learned about before -- if the result of the block is negative, the element on the left is "smaller" than the element on the right. 0 means they are equal. A positive result means the left element is greater.


### Enumerable methods

You may use the new methods after requiring the file with `require './enumerable_methods'`.

* Extend Ruby's Enumerable module to include `#my_each`, `#my_each_with_index`, `#my_select`, `#my_all?`, `#my_any?`, `#my_none?`, `#my_count`, `#my_map`, and `#my_inject`.  Each of these methods perform similarly to the corresponding Enumerable method (e.g `#my_each` is similar to `#each`).'>)

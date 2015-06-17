require './node'

class BST
  attr_accessor :root

  def initialize(value = nil)
	@root = Node.new(value) unless value.nil?
  end

  def BST.build_tree(array)
	bst = BST.new
	array.each do |element|
	  bst.add(element)
	end
	return bst
  end

  def add(element)
	if @root.nil?
	  @root = Node.new(element)
	else
	  add_to_tree(Node.new(element),@root)
	end
  end

  def add_to_tree(node, parent)
	return node if parent.nil?
	node.parent_node = parent
	if node.value < parent.value
	  parent.left_child = add_to_tree(node,parent.left_child)
	else
	  parent.right_child = add_to_tree(node,parent.right_child)
	end
	return parent
  end

  def display_in_order(bst)
	if !bst.left_child.nil?
	  display_in_order(bst.left_child)
	end
	print "#{bst.value}, "
	if !bst.right_child.nil?
	  display_in_order(bst.right_child)
	end
  end

  def bfs(x)
    queue = [@root]
	while !queue.empty?
	  act_node = queue.shift
	  return act_node.value if act_node.value == x
	  queue << act_node.left_child if !act_node.left_child.nil?
	  queue << act_node.right_child if !act_node.right_child.nil?
	end
	nil
  end

  def dfs(x)
    queue = [@root]
	while !queue.empty?
	  act_node = queue.pop
	  return act_node.value if act_node.value == x
	  queue << act_node.left_child if !act_node.left_child.nil?
	  queue << act_node.right_child if !act_node.right_child.nil?
	end
	nil
  end

  def dfs_rec(x,act_node)
	if act_node == nil
      return nil;
    else
	  return act_node.value if act_node.value == x
	  if act_node.value < x
		dfs_rec(x,act_node.right_child)
	  else 
		dfs_rec(x,act_node.left_child)
	  end
	end
  end

end

def display_menu
  par = <<-PARAGRAPH
This are the things you can do with this BST:
  1. Search for a value inside the using DFS algorithm
  2. Search for a value inside the tree using BSF algorithm
  3. Search for a value inside the tree using a recursive algorithm
  4. Exit the program
  PARAGRAPH
  puts par
end

def create_tree
  puts "Building the tree..."
  bst = BST.build_tree([4,9,10,222,-3,-32,24,56,78,2,3,24])
  bst.display_in_order(bst.root)
  puts "Done"
  puts
  loop do
	display_menu
	print "Your choice: "
	choice = gets.chomp
	case choice
	when "1"
	  print "Value to search for: " ; x = gets.chomp.to_i
	  puts "Found!" if !bst.dfs(x).nil?
	when "2"
	  print "Value to search for: " ; x = gets.chomp.to_i
	  puts "Found!" if !bst.bfs(x).nil?
	when "3"
	  print "Value to search for: " ; x = gets.chomp.to_i
	  puts "Found!" if !bst.dfs_rec(x,bst.root).nil?
	when "4"
	  exit
	else
	  puts "Wrong input, try again."
	end
  end
end

create_tree

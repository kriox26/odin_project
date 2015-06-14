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
	puts bst.value
	if !bst.right_child.nil?
	  display_in_order(bst.right_child)
	end
  end
end

def create_tree
  puts "Building the tree"
  bst = BST.build_tree([5,7,8,2,4,9,10,12])
  bst.display_in_order(bst.root)
end

create_tree

class Node
  attr_accessor :value, :parent_node, :left_child, :right_child
  def initialize(value, parent_node = nil, left_child = nil, right_child = nil)
	@value = value
	@parent_node = parent_node
	@left_child = left_child
	@right_child = right_child
  end
end

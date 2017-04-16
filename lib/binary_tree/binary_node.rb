# binary_node.rb
# Nodes for a binary tree
class BinaryNode
  attr_accessor :data, :left, :right

  def initialize(data, left_node = nil, right_node = nil)
    @data = data
    @left = left_node
    @right = right_node
  end

  def insert(val)
    if val <= @data
      @left.nil? ? @left = BinaryNode.new(val) : @left.insert(val)
    elsif val > @data
      @right.nil? ? @right = BinaryNode.new(val) : @right.insert(val)
    end
  end
end

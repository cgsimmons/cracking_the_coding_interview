# binary_tree.rb
require_relative './binary_node.rb'

# Binary tree
class BinaryTree
  attr_reader :root
  def initialize(data)
    @root = BinaryNode.new(data)
  end

  def insert(val)
    @root.insert(val)
  end

  def levels_hash()
    q = [@root]
    hash = Hash.new { |h, k| h[k] = [] }
    level = 0
    until q.empty?
      level_size = q.length
      level_size.times do
        tmp_node = q.shift
        hash[level] << tmp_node.data
        q << tmp_node.left unless tmp_node.left.nil?
        q << tmp_node.right unless tmp_node.right.nil?
      end
      level += 1
    end
    hash
  end
end

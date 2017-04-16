require 'spec_helper'
require_relative './binary_tree.rb'

describe 'test insert' do
  it 'insert nodes' do
    tree = BinaryTree.new(5)
    tree.insert(2)
    tree.insert(1)
    tree.insert(3)
    tree.insert(10)
    tree.insert(9)
    tree.insert(11)
    correct = { 0 => [5], 1 => [2, 10], 2 => [1, 3, 9, 11] }
    expect(tree.levels_hash).to eq(correct)
  end
end

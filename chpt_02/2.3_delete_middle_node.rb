# Implement an algorithm to delete a node in the middle (i.e., any
#  node but the first and last node, not necessarily the exact
#  middle) of a singly linked list, given only access to that node.
# EXAMPLE
# Input: the node c from the linked list
#  a->b->c->d->e->f
# Result: nothing is returned, but the new linked list looks like
#  a->b->d->e->f

require 'spec_helper'
require_relative './linked_list.rb'

describe 'delete node from middle' do
  it 'delete some node' do
    new_list = LinkedList.new(1)
    new_list.append(5)
    new_list.append(15)
    new_list.delete(5)
    expect(new_list.to_array).to eq([1, 15])
  end
end

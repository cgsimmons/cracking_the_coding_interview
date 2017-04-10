# Write code to partition a linked list around a value x, such
#  that all nodes less than x come before all nodes greater
#  than or equal to x . lf x is contained within the list, the
#  values of x only need to be after the elements less than x
#  (see below) . The partition element x can appear anywhere in
#  the "right partition"; it does not need to appear between
#  the left and right partitions.
# EXAMPLE
# Input: 3 -> 5 -> 8 -> 5 -> 10 -> 2 -> 1 [partition = 5)
# Output: 3 -> 1 -> 2 -> 10 -> 5 -> 5 -> 8

require 'spec_helper'
require_relative './linked_list.rb'

describe 'partition' do
  it 'partition from middle' do
    new_list = LinkedList.new(3)
    new_list.append(5)
    new_list.append(8)
    new_list.append(5)
    new_list.append(10)
    new_list.append(2)
    new_list.append(1)
    new_list.partition(5)
    expect(new_list.to_array).to eq([1, 2, 3, 5, 8, 5, 10])
  end
end

# You have two numbers represented by a linked list, where each node
#  contains a single digit. The digits are stored in reverse order, such
#  that the 1 's digit is at the head of the list. Write a function that
#  adds the two numbers and returns the sum as a linked list.
# EXAMPLE
# Input: (7-> 1 -> 6) + (5 -> 9 -> 2) .Thatis,617 + 295.
# Output: 2 -> 1 -> 9. That is, 912.
# FOLLOW UP
# Suppose the digits are stored in forward order. Repeat the above problem.
# EXAMPLE
# Input: (6 -> 1 -> 7) + (2 -> 9 -> 5) . Thatis,617 + 295 .
# Output: 9 -> 1 -> 2. That is, 912.

require 'spec_helper'
require_relative '../lib/linked_list/linked_list.rb'

def sum_lists(list_one, list_two)
  remainder = 0
  current_one = list_one.head
  current_two = list_two.head
  result_list = LinkedList.new(0)
  tmp_result = nil
  while current_one || current_two
    if current_one.nil?
      one_data = 0
      one_next = nil
    else
      one_data = current_one.data
      one_next = current_one.next
    end
    if current_two.nil?
      two_data = 0
      one_next = nil
    else
      two_data = current_two.data
      two_next = current_two.next
    end
    if tmp_result
      tmp_result.next = Node.new(0, nil)
      tmp_result = tmp_result.next
    else
      tmp_result = result_list.head
    end
    sum = one_data + two_data + remainder
    if sum > 9
      remainder = 1
      sum -= 10
    else
      remainder = 0
    end
    tmp_result.data = sum
    current_one = one_next
    current_two = two_next
  end
  result_list
end

describe 'Sum lists' do
  it 'Add lists' do
    list_one = LinkedList.new(7)
    list_one.append(1)
    list_one.append(6)
    list_two = LinkedList.new(5)
    list_two.append(9)
    list_two.append(2)
    expect(sum_lists(list_one, list_two).to_array).to eq([2, 1, 9])
  end
  it 'Add lists one number longer' do
    list_one = LinkedList.new(7)
    list_one.append(1)
    list_one.append(6)
    list_one.append(2)
    list_two = LinkedList.new(5)
    list_two.append(9)
    list_two.append(2)
    expect(sum_lists(list_one, list_two).to_array).to eq([2, 1, 9, 2])
  end
end

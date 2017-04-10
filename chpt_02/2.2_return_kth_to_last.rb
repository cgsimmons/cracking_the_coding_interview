# Implement an algorithm to find the kth to last element
#  of a singly linked list.

require 'spec_helper'
require_relative './linked_list.rb'

describe 'return_kth_to_last' do
  it 'last element' do
    new_list = LinkedList.new(1)
    new_list.append(5)
    new_list.append(15)
    expect(new_list.kth_to_last_element(1)).to eq(15)
  end
  it '2nd to last element' do
    new_list = LinkedList.new(2)
    new_list.append(5)
    new_list.append(15)
    expect(new_list.kth_to_last_element(2)).to eq(5)
  end
  it '3rd to last element which is first' do
    new_list = LinkedList.new(2)
    new_list.append(5)
    new_list.append(15)
    expect(new_list.kth_to_last_element(3)).to eq(2)
  end
  it 'k is larger than list size' do
    new_list = LinkedList.new(2)
    new_list.append(5)
    new_list.append(15)
    expect(new_list.kth_to_last_element(4)).to eq(2)
  end
end

# Write code to remove duplicates from an unsorted li nked list.
# FOLLOW UP
# How would you solve this problem if a temporary buffer is not allowed?

require 'spec_helper'
require_relative './linked_list.rb'

describe 'remove_dups without buffer' do
  it 'remove dup in middle' do
    new_list = LinkedList.new(5)
    new_list.append(5)
    new_list.append(15)
    new_list.remove_dups_no_buffer
    expect(new_list.to_array).to eq([5, 15])
  end
  it 'remove dup at end' do
    new_list = LinkedList.new(10)
    new_list.append(15)
    new_list.append(5)
    new_list.append(10)
    new_list.remove_dups_no_buffer
    expect(new_list.to_array).to eq([10, 15, 5])
  end
  it 'remove dups from all dups' do
    new_list = LinkedList.new(5)
    new_list.append(5)
    new_list.append(5)
    new_list.append(5)
    new_list.remove_dups_no_buffer
    expect(new_list.to_array).to eq([5])
  end
end

describe 'remvove_dups with buffer' do
  it 'remove dup in middle' do
    new_list = LinkedList.new(5)
    new_list.append(5)
    new_list.append(15)
    new_list.remove_dups_with_buffer
    expect(new_list.to_array).to eq([5, 15])
  end
  it 'remove dup at end' do
    new_list = LinkedList.new(10)
    new_list.append(15)
    new_list.append(5)
    new_list.append(10)
    new_list.remove_dups_with_buffer
    expect(new_list.to_array).to eq([10, 15, 5])
  end
  it 'remove dups from all dups' do
    new_list = LinkedList.new(5)
    new_list.append(5)
    new_list.append(5)
    new_list.append(5)
    new_list.remove_dups_with_buffer
    expect(new_list.to_array).to eq([5])
  end
end

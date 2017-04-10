# linked_list.rb
require_relative './node.rb'

# Singly Linked list implementation
class LinkedList
  def initialize(data)
    @head = Node.new(data, nil)
  end

  def append(data)
    current_node = @head
    current_node = current_node.next while current_node.next
    current_node.next = Node.new(data, nil)
  end

  def delete(data)
    current_node = @head
    if current_node.data == data
      @head = current_node.next
    else
      while current_node.next && current_node.next.data != data
        current_node = current_node.next
      end
      current_node.next = current_node.next.next if current_node.next
    end
  end

  def print_list
    arr = to_array
    arr.each do |node|
      puts node
    end
  end

  def to_array
    list_array = []
    current_node = @head
    while current_node.next
      list_array.push(current_node.data)
      current_node = current_node.next
    end
    list_array.push(current_node.data)
  end

  # remove duplicates without a buffer
  # Runs in O(1) space, but in O(n^2) time
  def remove_dups_no_buffer
    current_node = @head
    while current_node
      tmp_node = current_node
      while tmp_node.next
        if tmp_node.next.data == current_node.data
          tmp_node.next = tmp_node.next.next
        else
          tmp_node = tmp_node.next
        end
      end
      current_node = current_node.next
    end
  end

  # remove duplicates with a buffer
  # Runs in O(n) time
  def remove_dups_with_buffer
    hash = {}
    previous = nil
    current_node = @head
    while current_node
      symbol = current_node.data.to_s
      if hash.key?(symbol)
        previous.next = current_node.next
      else
        hash[symbol] = current_node.data
        previous = current_node
      end
      current_node = current_node.next
    end
  end
end
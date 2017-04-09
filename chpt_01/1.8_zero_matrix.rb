# Write an algorithm such that if an element in an MxN matrix
#  is 0, its entire row and column are set to O.

require 'spec_helper'

def zero_matrix(matrix)
  hash = get_zeroes(matrix)
  insert_zeroes(hash, matrix)
end

# Hash must follow schema {"rows"=>[<row indecies>], "cols"=>[<col indecies]}
def insert_zeroes(hash, matrix)
  matrix.each_with_index do |x, row|
    x.each_with_index do |_y, col|
      if hash['rows'].include?(row) || hash['cols'].include?(col)
        matrix[row][col] = 0
      end
    end
  end
  matrix
end

def get_zeroes(matrix)
  hash = { 'rows' => [], 'cols' => [] }
  matrix.each_with_index do |x, row|
    x.each_with_index do |y, col|
      if y.zero?
        hash['rows'].push(row)
        hash['cols'].push(col)
      end
    end
  end
  hash
end

describe 'Matrix Test' do
  it 'test with one zero' do
    m = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [9, 10, 11]]
    z = [[0, 0, 0], [0, 4, 5], [0, 7, 8], [0, 10, 11]]
    expect(zero_matrix(m)).to eq(z)
  end
  it 'test with 2 zeroes' do
    m = [[0, 1, 2], [3, 4, 5], [6, 0, 8], [9, 10, 11]]
    z = [[0, 0, 0], [0, 0, 5], [0, 0, 0], [0, 0, 11]]
    expect(zero_matrix(m)).to eq(z)
  end
end

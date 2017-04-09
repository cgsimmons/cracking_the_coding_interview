# Given an image represented by an NxN matrix, where each pixel
#  in the image is 4 bytes, write a method to rotate the image
#  by 90 degrees. (an you do this in place?

require 'spec_helper'

# Rotate direction = clockwise || countercw
def rotate_matrix(matrix, direction)
  if direction == 'clockwise'
    rotate_cw(matrix)
  else
    rotate_countercw(matrix)
  end
end

def rotate_cw(matrix)
  # not in place example
  # matrix.reverse.transpose

  # in place
  matrix.reverse!.each_with_index do |_, i|
    (0...i).each do |j|
      matrix[j][i], matrix[i][j] = matrix[i][j], matrix[j][i]
    end
  end
end

def rotate_countercw(matrix)
  # not in place example
  # matrix.transpose.reverse

  # in place
  matrix.map(&:reverse!).each_with_index do |_, i|
    (0...i).each do |j|
      matrix[j][i], matrix[i][j] = matrix[i][j], matrix[j][i]
    end
  end
end

describe 'Matrix Test' do
  it 'clockwise rotation' do
    m = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]
    r = [[13, 9, 5, 1], [14, 10, 6, 2], [15, 11, 7, 3], [16, 12, 8, 4]]
    expect(rotate_matrix(m, 'clockwise')).to eq(r)
  end
  it 'counter-clockwise rotation' do
    m = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]
    r = [[4, 8, 12, 16], [3, 7, 11, 15], [2, 6, 10, 14], [1, 5, 9, 13]]
    expect(rotate_matrix(m, 'countercw')).to eq(r)
  end
end

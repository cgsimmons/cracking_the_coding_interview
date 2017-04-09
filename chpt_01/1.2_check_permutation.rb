# Given two strings, write a method to decide
# if one is a permutation of the other.

require 'spec_helper'

def check_perm(str_one, str_two)
  str_one.each_char do |char|
    return false if str_one.count(char) != str_two.count(char)
  end
  true
end

describe 'Tests' do
  it 'should be true' do
    expect(check_perm('abc', 'bca')).to be true
  end
  it 'should not be true' do
    expect(check_perm('abc', 'def')).to be false
  end
end

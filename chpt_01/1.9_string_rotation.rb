# Assume you have a method isSubstring which checks if one word is
#  a substring of another. Given two strings, s1 and s2, write code
#  to check if s2 is a rotation of s1 using only one call to
#  isSubstring (e.g., 'waterbottle' is a rotation of 'erbottlewat').

require 'spec_helper'

def rotation?(str_one, str_two)
  return false if str_one.length != str_two.length || str_one.length.zero?
  # isSubsstring is include? in this case
  (str_one + str_one).include?(str_two)
end

describe 'rotation?' do
  it 'not even close' do
    expect(rotation?('test', 'whatever')).to be(false)
  end
  it 'return true' do
    expect(rotation?('test', 'estt')).to be(true)
  end
end

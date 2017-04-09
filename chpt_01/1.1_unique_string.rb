# Implement an algorithm to determine if a string has
#  all unique characters. What if you cannot use
#  additional data structures?

require 'spec_helper'

def dups?(s)
  return false if s.size <= 1
  s.split('').uniq.size != s.split('').size
end

describe 'dups?' do
  it 'returns false for an empty or one-element string' do
    expect(dups?('')).to be false
    expect(dups?('a')).to be false
  end
  it 'returns false for a string with no dups' do
    expect(dups?('12')).to be false
    expect(dups?('123')).to be false
  end
  it 'returns true for a string with dups' do
    expect(dups?('aa')).to be true
    expect(dups?('abacdea')).to be true
  end
  it 'properly handles embedded newlines' do
    expect(dups?('abc\n456')).to be false
    expect(dups?('abc\n456c')).to be true
    expect(dups?('abc\n456\n')).to be true
  end
end

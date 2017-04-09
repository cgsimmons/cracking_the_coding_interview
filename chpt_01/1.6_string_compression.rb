# Implement a method to perform basic string compression using the
#  counts of repeated characters. For example, the string aabcccccaaa
#  would become a2b1c5a3. If the "compressed" string would not become
#  smaller than the original string, your method should return the
#  original string. You can assume the string has only uppercase and
#  lowercase letters (a - z).

require 'spec_helper'

def compress(str)
  result = []
  compressed = false
  str.each_char do |char|
    compressed = compress_char(result, char)
  end
  compressed ? result.join('') : str
end

def compress_char(result, char)
  if result[-2] != char
    result.push(char).push(1)
    false
  else
    result[-1] += 1
    true
  end
end

describe 'Test' do
  it 'typical case' do
    expect(compress('aabcccccaaa')).to eq('a2b1c5a3')
  end
  it 'no compression' do
    expect(compress('abca')). to eq('abca')
  end
  it 'null string' do
    expect(compress('')). to eq('')
  end
end

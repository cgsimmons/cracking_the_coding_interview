# Implement a method to perform basic string compression using the
#  counts of repeated characters. For example, the string aabcccccaaa
#  would become a2b1c5a3. If the "compressed" string would not become
#  smaller than the original string, your method should return the
#  original string. You can assume the string has only uppercase and
#  lowercase letters (a - z).

require 'spec_helper'

def compress(str)
  result = []
  tmp = ''
  compress = false
  str.each_char do |char|
    if tmp != char
      tmp = char
      result.push(tmp)
      result.push(1)
    else
      result[-1] += 1
      compress = true
    end
  end
  compress ? result.join('') : str
end

describe 'Test' do
  it 'typical case' do
    expect(compress('aabcccccaaa')).to eq('a2b1c5a3')
  end
  it 'no compression' do
    expect(compress('abca')). to eq('abca')
  end
end

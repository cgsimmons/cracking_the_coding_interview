# test_kmp.rb

require 'spec_helper'
require_relative './kmp.rb'

describe 'KMP get backtrace array' do
  it 'test substr' do
    correct = [0, 0, 0, 0, 1, 2, 3, 1]
    expect(Kmp.get_backtrace_array('abcdabca')).to eq(correct)
  end
end

describe 'KMP algorithm' do
  context 'find matches' do
    it 'test substring match in beginning' do
      expect(Kmp.substr('ABCDABDOBJACJABCDE', 'ABCD')).to be(true)
    end
    it 'test substring match in middle' do
      expect(Kmp.substr('ABDOBJAABCDCJABCE', 'ABCD')).to be(true)
    end
    it 'test substring match in end' do
      expect(Kmp.substr('ABDOBJAABCCJABCEABCD', 'ABCD')).to be(true)
    end
  end
  context 'no matches' do
    it 'test substring mismatch' do
      expect(Kmp.substr('ABCABDOBJACJABCDE', 'ABCDEF')).to be(false)
    end
  end
end

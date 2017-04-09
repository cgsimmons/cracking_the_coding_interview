require 'spec_helper'

def one_away(str_one, str_two)
  return false if (str_one.chars - str_two.chars).length > 1
  true
end

describe 'Test' do
  it 'equal strings' do
    expect(one_away('pale', 'pale')).to be(true)
  end
  it 'one delete away' do
    expect(one_away('pale', 'ple')).to be(true)
  end
  it 'one change away' do
    expect(one_away('pale', 'bale')).to be(true)
  end
  it 'two steps away' do
    expect(one_away('pale', 'bake')).to be(false)
  end
end

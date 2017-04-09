# Palindrome Permutation: Given a string, write a function to check if it
#  is a permutation of a palin-drome. A palindrome is a word or phrase that
#  is the same forwards and backwards. A permutation is a rea rrangement of
#  letters. The palindrome does not need to be limited to just dictionary words.
# EXAMPLE
# Input: Tact Coa
# Output: True (permutations: "taco cat". "atco cta". etc.)

def palin_perm(str)
  # remove unnecessary spaces
  str.delete!(' ')

  # create hash[char] = count
  hash = Hash[
    str.downcase
       .split('')
       .group_by { |c| c }
       .map { |k, v| [k, v.size] }
  ]

  # Set limit for odd characters based on str length
  odd_test = str.length.odd? ? 2 : 1

  # Test that odd characters in str do not exceed limit
  hash.values.select(&:odd?).length < odd_test
end

describe 'Test' do
  it 'should be true' do
    expect(palin_perm('racecar')).to be(true)
  end
  it 'should be false' do
    expect(palin_perm('mudd')).to be(false)
  end
end

# kmp.rb

# Knuth Morris Pratt algorithm
module Kmp
  def Kmp.get_backtrace_array(str)
    t = [0]
    j = 0
    (1...str.length).each do |i|
      if str[i] == str[j]
        t << j + 1
        j += 1
      else
        j = t[j - 1] while str[j] != str[i] && j > 1
        j += 1 if str[j] == str[i]
        t << j
      end
    end
    t
  end

  def Kmp.substr(str_one, str_two)
    t = get_backtrace_array(str_two)
    m = 0
    i = 0
    while m + i < str_one.length
      if str_two[i] == str_one[m + i]
        return true if i == str_two.length - 1
        i += 1
      elsif t[i] > 0
        m += i - t[i]
        i = t[i]
      else
        m += 1
        i = 0
      end
    end
    false
  end
end

require 'benchmark'

def edit_distance(str1, str2, memo = {})
  return memo[[str1, str2].to_s] if memo[[str1, str2].to_s]
  return str2.length if str1.length == 0
  return str1.length if str2.length == 0

  delta = (str1[-1] <=> str2[-1]).abs

  result = [
    edit_distance(str1[0...-1], str2[0...-1], memo) + delta,
    edit_distance(str1, str2[0...-1], memo) + 1,
    edit_distance(str1[0...-1], str2, memo) + 1
  ].min

  memo[[str1, str2].to_s] = result
end

Benchmark.bm do |x|
  x.report { puts edit_distance 'Shakespear', 'shakes peer' }
end

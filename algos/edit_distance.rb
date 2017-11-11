
def edit_distance(str1, str2)
  return str2.length if str1.length == 0
  return str1.length if str2.length == 0

  delta = (str1[-1] <=> str2[-1]).abs

  [
    edit_distance(str1[0...-1], str2[0...-1]) + delta,
    edit_distance(str1, str2[0...-1]) + 1,
    edit_distance(str1[0...-1], str2) + 1
  ].min
end

puts edit_distance 'agcd', 'agcde'

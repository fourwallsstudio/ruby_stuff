def find_target_row(arr, tgt)
  return arr[0] if arr.length == 1

  i = arr.length / 2
  mid = arr[i][0]

  if mid > tgt
    return find_target_row(arr[0...i], tgt)
  else
    return find_target_row(arr[i..-1], tgt)
  end
end

arr = Array.new(5) { [] }

5.times do |i|
  5.times { |j| arr[i] << (i * 5 + j) }
end

puts find_target_row(arr, 24)

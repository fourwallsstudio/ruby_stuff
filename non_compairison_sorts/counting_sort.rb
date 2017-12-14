
# assuming all nums in arr are between a min and mix eg; 0-9
def counting_sort(arr)
  count = Array.new(10) {0}
  arr.each { |n| count[n] += 1 }
  
  sorted = []
  count.each_with_index { |n, i| n.times { sorted << i } }
  sorted
end

puts counting_sort([1,4,2,2,3,4,5,6,7,5,3,4,5,7,9,0,9,8,7,6,7,6,5,4,4,3,1])

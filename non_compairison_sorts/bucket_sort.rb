require_relative '../heaps/binary_min_heap'

# each bucket is a 10 digit range eg: 0-9, 10-19, 20-29 ...
def bucket_sort(arr)
        buckets = Array.new(10) {BinaryMinHeap.new}
        
        arr.each do |num|
                buckets[num / 10].push(num)
        end

        sorted = []

        buckets.each do |heap|
          num = heap.extract

          while !num.nil?
            sorted << num
            num = heap.extract
          end
        end

        sorted
end

puts bucket_sort([4, 50, 34, 62, 34, 87, 21, 0, 3, 48, 86, 75, 63, 93, 89])

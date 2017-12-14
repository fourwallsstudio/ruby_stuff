
def bucket_sort(arr, idx)
        buckets = Array.new(26) {[]}
        arr.each { |str| buckets[str[idx].ord - 96] << str }
        buckets.flatten
end


# assuming all strings in arr are of same length
def radix_sort(arr)
        sorted = arr

        (arr[0].length - 1).downto(0) do |i|
                  sorted = bucket_sort(sorted, i)
        end
        
        sorted
end

puts radix_sort(['cat', 'rat', 'mat', 'chi', 'key', 'hat', 'dog'])

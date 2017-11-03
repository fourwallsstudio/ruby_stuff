def mergesort(arr)
  return arr if arr.length == 1

  mid = arr.length / 2
  left = mergesort(arr.take(mid))
  right = mergesort(arr.drop(mid))

  return merge(left, right)
end

def merge(left, right)
  merged = []

  while left.length > 0 && right.length > 0
    if (left[0] <=> right[0]) <= 0  #preserve order for dups
      merged << left.shift
    else
      merged << right.shift
    end
  end

  left + merged + right
end

arr = [1, 5, 3, 6, 5, 7, 8, 2, 9]

puts mergesort(arr)

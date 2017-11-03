# O(n**2)
def instertionsort(arr)
  return arr if arr.length <= 1

  i = 1
  while i < arr.length

    j = i - 1
    while j >= 0
      # compairing could be reduced to O(log n) by using
      # binary search to find index. Swapping would still be O(n) if
      # inserting into beginning/mid of array.
      break if arr[j] <= arr[j+1]
      arr[j], arr[j+1] = arr[j+1], arr[j]
      j -= 1
    end

    i += 1
  end

  arr
end

arr = [5, 4, 3, 2, 6, 7, 3, 4, 1]

puts instertionsort(arr)

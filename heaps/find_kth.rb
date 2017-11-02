require_relative 'binary_min_heap'

def find_kth_largest(arr, k)
  arr = arr.dup

  # use prc to turn min heap into max heap
  prc = Proc.new { |a, b|  -1 * (a <=> b) }

  # create max heap
  i = 0
  while i < arr.length
    BinaryMinHeap.heapify_up(arr, i, &prc)
    i += 1
  end

  i = arr.length - 1
  while i > arr.length - k
    arr[0], arr[i] = arr[i], arr[0]
    BinaryMinHeap.heapify_down(arr, 0, i, &prc)
    i -= 1
  end

  return arr.first
end

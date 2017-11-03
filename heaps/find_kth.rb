require_relative 'binary_min_heap'

# O(kn)
def find_kth_largest(arr, k)
  arr = arr.dup

  prc = Proc.new { |a, b| -1 * (a <=> b) } # proc for max heap
  max_heap = BinaryMinHeap.new(arr, &prc) # build max heap - O(n)

  (k - 1).times { max_heap.extract } # O(kn) - extract uses heapify_down which is O(n)

  max_heap.extract
end

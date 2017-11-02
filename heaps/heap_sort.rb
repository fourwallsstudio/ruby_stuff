require_relative 'binary_min_heap'

class Array
  def heap_sort!
    # use prc to turn min heap into max heap
    prc = Proc.new { |a, b|  -1 * (a <=> b) }

    # create max heap
    i = 0
    while i < length
      BinaryMinHeap.heapify_up(self, i, &prc)
      i += 1
    end

    i = length - 1
    while i > 0
      self[0], self[i] = self[i], self[0]
      BinaryMinHeap.heapify_down(self, 0, i, &prc)
      i -= 1
    end

    self
  end
end

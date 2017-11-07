# find - O(n)
# insert - O(log n)
# delete - O(log n)

class BinaryMinHeap

  attr_reader :store, :prc

  def initialize(arr = Array.new, &prc)
    @store = BinaryMinHeap.build_heap(arr, &prc)
    @prc = prc || Proc.new { |a, b| a <=> b }
  end

  def count
    store.length
  end

  def extract
    store[0], store[count - 1] = store[count - 1], store[0]
    item = store.pop
    BinaryMinHeap.heapify_down(store, 0, &prc)
    item
  end

  def peek
    store.first
  end

  def push(val)
    store << val
    BinaryMinHeap.heapify_up(store, count - 1, &prc)
  end

  def self.child_indices(len, parent_index)
    pi = parent_index * 2
    [pi + 1, pi + 2].select { |i| i < len }
  end

  def self.parent_index(child_index)
    child_index == 0 ? nil : (child_index - 1) / 2
  end

  # O(n)
  def self.heapify_down(arr, parent_idx, len = arr.length, &prc)
    prc = prc || Proc.new { |a, b| a <=> b }
    current_node = arr[parent_idx]
    children_indices = self.child_indices(len, parent_idx)
    heapified = false

    while !heapified
      #sort so parent always switches with smallest
      children_indices.reverse! if children_indices.length > 1 &&
        prc.call(children_indices.map { |i| arr[i] }) == 1

      if !children_indices[0].nil? &&
        prc.call(current_node, arr[children_indices[0]]) == 1

        arr[parent_idx], arr[children_indices[0]] =
          arr[children_indices[0]], arr[parent_idx]

        parent_idx = children_indices[0]
        current_node = arr[parent_idx]
        children_indices = self.child_indices(len, parent_idx)
      else
        heapified = true
      end
    end

    arr
  end

  #O(n log n)
  def self.heapify_up(arr, child_idx, &prc)
    prc = prc || Proc.new { |a,b| a <=> b }
    current_node = arr[child_idx]
    parent_idx = self.parent_index(child_idx)
    heapified = false

    while !heapified
      if !parent_idx.nil? && prc.call(current_node, arr[parent_idx]) == -1

        arr[child_idx], arr[parent_idx] = arr[parent_idx], arr[child_idx]

        child_idx = parent_idx
        current_node = arr[child_idx]
        parent_idx = self.parent_index(child_idx)
      else
        heapified = true
      end
    end

    arr
  end

  # O(n) - bound by constant k + 1 / 2**k
  def self.build_heap(arr, &prc)
    return arr if arr.empty?
    # every element after mid index is a leaf node.
    mid = arr.length / 2

    mid.downto(0) do |i|
      heapify_down(arr, i, &prc)
    end

    arr
  end
end

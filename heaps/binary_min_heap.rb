class BinaryMinHeap

  attr_reader :store, :prc

  def initialize(&prc)
    @store = Array.new
    @prc = prc || Proc.new { |a, b| a <=> b }
  end

  def count
    store.length
  end

  def extract
    store[0], store[count - 1] = store[count - 1], store[0]
    item = store.pop
    BinaryMinHeap.heapify_down(store, 0)
    item
  end

  def peek
    store[0]
  end

  def push(val)
    store << val
    BinaryMinHeap.heapify_up(store, count - 1)
  end

  def self.child_indices(len, parent_index)
    indicies = []
    child1_idx = parent_index * 2 + 1
    child2_idx = child1_idx + 1
    indicies << child1_idx if child1_idx < len
    indicies << child2_idx if child2_idx < len
    indicies
  end

  def self.parent_index(child_index)
    child_index == 0 ? nil : (child_index - 1) / 2
  end

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

  def self.heapify_up(arr, child_idx, len = arr.length, &prc)
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
end

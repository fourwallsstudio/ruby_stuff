require_relative 'binary_min_heap'

describe BinaryMinHeap do
  prc = Proc.new { |a, b| a - b }
  subject { BinaryMinHeap.new(&prc) }

  it 'initializes with prc if given' do
    expect(subject.prc).to eq(prc)
  end

  describe '::child_indices' do
    it 'returns the right indicies' do
      expect(BinaryMinHeap.child_indices(3, 0)).to eq([1,2])
      expect(BinaryMinHeap.child_indices(9, 3)).to eq([7,8])
      expect(BinaryMinHeap.child_indices(13, 5)).to eq([11,12])
    end

    it 'only returns indicies within length' do
      expect(BinaryMinHeap.child_indices(12, 5)).to eq([11])
    end
  end

  describe '::parent_index' do
    it 'returns the right index' do
      expect(BinaryMinHeap.parent_index(2)).to eq(0)
      expect(BinaryMinHeap.parent_index(9)).to eq(4)
      expect(BinaryMinHeap.parent_index(10)).to eq(4)
    end

    it 'returns nil if no parent_index' do
      expect(BinaryMinHeap.parent_index(0)).to be_nil
    end
  end

  describe '::heapify_down' do
    it 'sorts into a valid heap while child is smaller' do
      arr = [9, 5, 4, 7, 6, 8, 9]
      expect(BinaryMinHeap.heapify_down(arr, 0)).to eq([4, 5, 8, 7, 6, 9, 9])
    end
  end

  describe '::heapify_up' do
    it 'sorts into a valid heap while parent is larger' do
      arr = [2, 3, 4, 5, 6, 7, 8, 9, 1]
      expect(BinaryMinHeap.heapify_up(arr, 8)).to eq([1, 2, 4, 3, 6, 7, 8, 9, 5])
    end
  end

  describe '::build_heap' do
    it 'builds a valid heap from an array' do
      arr = [9, 7, 5, 8, 4, 7, 1, 2, 4]
      expect(BinaryMinHeap.build_heap(arr)).to eq([1, 2, 5, 4, 4, 7, 9, 8, 7])
    end
  end
end

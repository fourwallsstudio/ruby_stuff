require_relative 'heap_sort'

describe '#heap_sort' do
  it 'sorts an array' do
    arr = [9, 8, 7, 6, 5, 4, 3, 2, 1]
    expect(arr.heap_sort!).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it 'sorts an array into a valid max heap' do
    skip
    arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    prc = Proc.new { |a, b| -1 * (a <=> b) }
    expect(heap_sort(arr, &prc)).to eq([9, 8, 6, 7, 3, 2, 5, 1, 4])
  end
end

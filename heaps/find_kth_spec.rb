require_relative 'find_kth'

describe '#find_kth_largest' do
  it 'finds the kth largest element' do
    arr = [5, 6, 3, 2, 4, 9]
    expect(find_kth_largest(arr, 1)).to eq(9)
    expect(find_kth_largest(arr, 2)).to eq(6)
    expect(find_kth_largest(arr, 6)).to eq(2)
  end

  it 'finds the kth largest element with doubles' do
    arr = [5, 6, 3, 3, 2, 4, 9]
    expect(find_kth_largest(arr, 1)).to eq(9)
    expect(find_kth_largest(arr, 2)).to eq(6)
    expect(find_kth_largest(arr, 5)).to eq(3)
    expect(find_kth_largest(arr, 6)).to eq(3)
  end
end

require_relative 'ring_buffer'

describe RingBuffer do
  subject { RingBuffer.new }
  items = []
  8.times { |i| items.push("item_#{(i + 97).chr}") }
  #['item_a', 'item_b', ... 'item_h']

  it 'starts out with empty arr' do
    expect(subject.length).to eq(0)
  end

  it 'raises error if idx is out of bounds' do
    expect { subject[4] }.to raise_error('index out of bounds')
    expect { subject[0] = 'hi' }.to raise_error('index out of bounds')
  end

  describe '#first' do
    it 'returns first item in array' do
      items.each { |item| subject.push(item) }
      expect(subject.first).to eq(items[0])
    end

    it 'return nil whem array is empty' do
      expect(subject.first).to be_nil
    end
  end

  describe '#last' do
    it 'returns last item in array' do
      items.each { |item| subject.push(item) }
      expect(subject.last).to eq(items[7])
    end

    it 'return nil whem array is empty' do
      expect(subject.last).to be_nil
    end
  end

  describe '#push' do
    it 'adds item to store' do
      subject.push(items[0])
      expect(subject[0]).to eq(items[0])
    end
  end

  describe '#unshift' do
    it 'adds item to empty store' do
      subject.unshift(items[0])
      expect(subject[0]).to eq(items[0])
    end

    it 'adds item to store with elements' do
      subject.unshift(items[0])
      subject.unshift(items[1])
      #[item_a, nil, nil, item_b]

      expect(subject[0]).to eq(items[1])
    end

    it 'decriments start_idx around ring' do
      subject.unshift(items[0])
      subject.unshift(items[1])
      #[item_a, nil, nil, nil, nil, nil, nil, items_b]

      expect(subject.send(:start_idx)).to eq(7)
    end
  end

  describe '#pop' do
    it 'removes last item in array' do
      items.each { |item| subject.push(item) }
      8.times { |i| expect(subject.pop).to eq(items[7 - i])}
    end

    it 'raise error if array is empty' do
      expect { subject.pop }.to raise_error('index out of bounds')
    end
  end

  describe '#shift' do
    it 'removes first item in array' do
      items.each { |item| subject.push(item) }
      8.times { |i| expect(subject.shift).to eq(items[i])}
    end

    it 'raise error if array is empty' do
      expect { subject.shift }.to raise_error('index out of bounds')
    end

    it 'increments start_idx around ring' do
      subject.push(items[0])
      subject.push(items[1])
      subject.unshift(items[3])
      # [item_a, item_b, nil, nil, nil, nil, nil, item_d]

      expect(subject.send(:start_idx)).to eq(7)
      subject.shift
      expect(subject.send(:start_idx)).to eq(0)
      subject.shift
      expect(subject.send(:start_idx)).to eq(1)
    end
  end

  describe '#resize!' do
    it 'doubles capacity of store when item_count equals capacity' do
      items.each { |item| subject.push(item) }
      subject.push('new_item')

      expect(subject.send(:capacity)).to eq(16)
      expect(subject.length).to eq(9)
      expect(subject.last).to eq('new_item')
    end

    it 'doubles capacity on unshift when item_count equals capacity' do
      items.each { |item| subject.unshift(item) }
      subject.unshift('new_item')

      expect(subject.send(:capacity)).to eq(16)
      expect(subject.length).to eq(9)
      expect(subject.last).to eq(items[0])
      expect(subject.send(:start_idx)).to eq(15)
    end
  end

  describe '#display' do
    it 'displays store' do
      subject.push(items[0])
      expect(subject.display).to eq(["item_a"])
    end
  end
end

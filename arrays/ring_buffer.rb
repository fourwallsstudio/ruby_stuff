class RingBuffer

  def initialize(size = 8)
    @store = Array.new(size)
    @capacity = size
    @item_count = 0
    @start_idx = 0
  end

  def length
    item_count
  end

  def first
    return nil if item_count == 0
    store[rb_idx(0)]
  end

  def last
    return nil if item_count == 0
    store[rb_idx(item_count - 1)]
  end

  def push(item)
    resize! if item_count == capacity

    idx = rb_idx(item_count)
    store[idx] = item
    @item_count += 1

    display
  end

  def unshift(item)
    resize! if item_count == capacity

    idx = item_count == 0 ? 0 : start_idx - 1
    store[idx] = item
    @start_idx = item_count == 0 ? 0 : (start_idx - 1) % capacity
    @item_count += 1

    display
  end

  def pop
    raise 'index out of bounds' if item_count == 0

    item = store[rb_idx(item_count - 1)]
    store[rb_idx(item_count - 1)] = nil
    @item_count -= 1

    item
  end

  def shift
    raise 'index out of bounds' if item_count == 0

    item = store[rb_idx(0)]
    store[rb_idx(0)] = nil
    @item_count -= 1
    @start_idx = item_count == 0 ? 0 : (start_idx + 1) % capacity

    item
  end

  def [](idx)
    check_bounds(idx)
    store[rb_idx(idx)]
  end

  def []=(idx, value)
    check_bounds(idx)
    store[rb_idx(idx)] = value
  end

  def display
    @store.rotate(@start_idx).select { |item| !item.nil? }
  end

  private
    attr_reader :store, :start_idx, :item_count, :capacity

    def rb_idx(idx)
      (start_idx + idx) % capacity
    end

    def check_bounds(idx)
      raise 'index out of bounds' if idx > item_count - 1
    end

    def resize!
      items = store.rotate(start_idx)
      @capacity *= 2
      @store = Array.new(capacity)
      @item_count = 0
      @start_idx = 0
      items.each { |item| self.push(item) }
    end
end

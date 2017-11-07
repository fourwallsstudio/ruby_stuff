class Queue
  def initialize
    @store = []
    @count = 0
  end

  def enqueue(item)
    @count += 1
    @store.push(item)
  end

  def dequeue
    @count -= 1
    @store.shift
  end

  def empty?
    @count == 0
  end

  def include?(item)
    @store.include?(item)
  end
end

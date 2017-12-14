class Link
  attr_accessor :data, :next, :prev

  def initialize(data)
    @data = data
    @next = nil
    @prev = nil
  end

  def to_s
    "data: #{data}, next: #{@next.data}"
  end
end


class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = Link.new('head')
    @tail = Link.new('tail')
    @head.next = @tail
    @tail.prev = @head
  end

  def first
    @head.next
  end

  def last
    @last.next
  end

  def append(node)
    node.prev = @tail.prev
    node.next = @tail
    @tail.prev.next = node
    @tail.prev = node
  end

  def remove(node)
    node.prev.next = node.next
    node.next.prev = node.prev
    delete node
  end

  def display
    items = []
    current_node = @head.next

    while current_node != @tail
      items << current_node.data
      current_node = current_node.next
    end

    items
  end
end

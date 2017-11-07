class Slot

  attr_accessor :key, :value, :status

  def initialize(key = nil, value = nil)
    @key = key
    @value = value
    @status = 'empty'
  end

  def empty?
    status == 'empty'
  end

  def open?
    status == 'empty' || status == 'deleted'
  end

  def occupied
    @status = 'occupied'
  end

  def delete
    @key = nil
    @value = nil
    @status = 'deleted'
  end
end

class OpenAddressHashTable

  attr_reader :num_slots, :store

  def initialize(size)
    @num_slots = size
    @store = Array.new(size) { Slot.new }
  end

  def set(key, value)
    index = key.hash % num_slots

    #linear probe
    i = 1
    while !store[index].open? && i < num_slots
      puts 'probe!'
      index = (key.hash + i) % num_slots
      i += 1
    end

    store[index].occupied
    store[index].key = key
    store[index].value = value
  end

  def lookup(key)
    index = find_index(key)
    index.nil? ? 'key not found' : store[index].value
  end

  def delete(key)
    index = find_index(key)
    return 'key not found' if index.nil?
    store[index].delete
  end

  private

    def find_index(key)
      index = key.hash % num_slots

      i = 1
      while !store[index].empty? &&
        store[index].key != key &&
        i < num_slots

        index = (key.hash + i) % num_slots
        i += 1
      end

      store[index].key == key ? index : nil
    end
end

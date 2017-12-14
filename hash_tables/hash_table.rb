class Link
	attr_accessor :key, :val, :next

	def initialize(key, val)
		@key, @val = key, val
		@next = nil
	end
end
    
class LinkedList
	attr_accessor :head

	def initialize
		@head = nil
	end

	def last
		current_link = @head

		while current_link
			return current_link if current_link.next.nil?
			current_link = current_link.next
		end
	
		nil
	end
	
	def insert(key, val)
		if @head.nil?
			@head = Link.new(key, val)
		else
			last.next = link
		end	
	end

	def delete(key)
		if @head.key == key
			@head = @head.next
			return key
		end

		prev_link = @head
		current_link = @head.next

		while !current_link.nil?
			if current_link.key == key
				prev_link.next = current_link.next
				return key
			end
			prev_link = current_link
			current_link = current_link.next
		end
		
		nil
	end

	def find(key)
		current_link = @head

		while !current_link.nil?
			return current_link if current_link.key == key
			current_link = current_link.next
		end
	
		nil
	end
end

class DynArr
	def initialize(capacity = 4)
		@capacity = capacity
		@store = Array.new(capacity) { LinkedList.new }
		@item_count = 0
	end

end


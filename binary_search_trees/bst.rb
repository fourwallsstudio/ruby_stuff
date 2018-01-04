class BSTNode
  attr_accessor :data, :left, :right, :parent

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
    @parent = nil
  end

  def display
    "data: #{@data}, left: #{@left}, right: #{@right}, parent: #{@parent}"
  end 
end


# find - O(log n)
# insert - O(n)
# delete - O(depth) Hibbard Deletion

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def find(el)

  end

  def delete(node)

  end

  def self.build_bst(arr)
  end

  def self.is_bst?(root_node)
  end
end

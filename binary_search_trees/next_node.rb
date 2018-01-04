require_relative 'bst'

root = BSTNode.new(10)
a = BSTNode.new(1)
b = BSTNode.new(5)
c = BSTNode.new(7)
d = BSTNode.new(12)
e = BSTNode.new(15)
f = BSTNode.new(17)

a.parent = b
b.left = a
b.right = c
b.parent = root
c.parent = b
root.left = b
root.right = e
e.parent = root
e.left = d
e.right = f
d.parent = e
f.parent = e

def next_node(node)
  return nil if node.nil?

  if node.right.nil?
    return nil if node.parent.nil? || node.parent.right == node
    return node.parent
  end

  current_node = node.right

  while !current_node.left.nil?
    current_node = current_node.left
  end

  current_node
end

puts next_node(d).display

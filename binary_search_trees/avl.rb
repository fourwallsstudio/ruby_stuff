class Node

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
    @height = nil
    @balance_factor = nil
  end
end

class AVLTree

  def initialize
    @root = nil
  end

  def rotate(node, direction)
  end

  def calc_height(node)
    node.height = 0 if node.left.nil? && node.right.nil?
    l, r = calc_height(node.left), calc_height(node.right)
    node.height = [l, r].max + 1
  end

  private

    def subtree_valid?(node)
      l, r = node.left.height, node.right.height
      (l - r).abs <= 1
    end
end

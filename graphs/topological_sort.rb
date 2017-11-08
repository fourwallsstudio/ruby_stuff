require 'set'

def topological_sort(nodes)
  visited = Set.new
  finished = []

  nodes.each do |node|
    dfs(node, nodes, visited, finished)
  end

  finished.reverse
end

def dfs(node, nodes, visited, finished)
  unless visited.include?(node)
    visited << node
    node.neighbors.each { |n| dfs(n, nodes, visited, finished) }
    finished << node
  end
end

require_relative 'graph'
require_relative 'topological_sort'

# Directional Acyclic Graph (DAG)
#
#  a  b   h
#  | / \
#  c   d
#  |  / 
#   e
#    \
#     f -- g


a = Node.new('a')
b = Node.new('b')
c = Node.new('c')
d = Node.new('d')
e = Node.new('e')
f = Node.new('f')
g = Node.new('g')
h = Node.new('h')

a.neighbors << c
b.neighbors << c
b.neighbors << d
c.neighbors << e
d.neighbors << e
e.neighbors << f
f.neighbors << g

nodes = [a, b, c, d, e, f, g, h]
answer = [h, b, d, a, c, e, f, g]

describe '#topological_sort' do
  it 'sorts nodes in topological order' do
    expect(topological_sort(nodes).map(&:data)).to eq(answer.map(&:data))
  end
end

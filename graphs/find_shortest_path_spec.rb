require_relative 'graph'
require_relative 'find_shortest_path'


#    m-------------------------
#   /                           \
# s -- c -- d ---- e      k ---- l       n
# |         | \    |      |      |
# a         |   \  |      |      |
# |         |     \|      |      |
# b         g ---- f ---- h ---- i ----- j

s = Node.new('s')
a = Node.new('a')
b = Node.new('b')
c = Node.new('c')
d = Node.new('d')
e = Node.new('e')
f = Node.new('f')
g = Node.new('g')
h = Node.new('h')
i = Node.new('i')
j = Node.new('j')
k = Node.new('k')
l = Node.new('l')
m = Node.new('m')
n = Node.new('n')

s.neighbors << a
s.neighbors << c
s.neighbors << m
a.neighbors << s
a.neighbors << b
b.neighbors << a
c.neighbors << s
c.neighbors << d
d.neighbors << c
d.neighbors << e
d.neighbors << f
d.neighbors << g
e.neighbors << d
e.neighbors << f
f.neighbors << d
f.neighbors << e
f.neighbors << g
f.neighbors << h
g.neighbors << d
g.neighbors << f
h.neighbors << f
h.neighbors << i
h.neighbors << k
i.neighbors << h
i.neighbors << j
i.neighbors << l
j.neighbors << i
k.neighbors << h
k.neighbors << l
l.neighbors << k
l.neighbors << i
l.neighbors << m
m.neighbors << s
m.neighbors << l


describe '#find_sortest_path' do
  it 'returns the shortest path' do
    expect(find_sortest_path(s, l)).to eq([m, l])
    expect(find_sortest_path(s, i)).to eq([m, l, i])
    expect(find_sortest_path(s, f)).to eq([c, d, f])
  end

  it 'return empty array when there is no path' do
    expect(find_sortest_path(s, n)).to be_empty
  end
end

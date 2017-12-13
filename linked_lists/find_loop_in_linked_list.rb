require_relative 'linked_list'

a = Link.new('a')
b = Link.new('b')
c = Link.new('c')
d = Link.new('d')
e = Link.new('e')
f = Link.new('f')
g = Link.new('g')
h = Link.new('h')
a.next = b
b.next = c
c.next = d
d.next = e
e.next = f
f.next = g
g.next = h
h.next = d

def has_loop? (head)
  p1 = head
  p2 = head

  while p1 && p2 && p2.next
    p1 = p1.next
    p2 = p2.next.next
    return true if p1 == p2
  end

  false
end

puts has_loop?(a)

def find_loop_start (head)
  p1 = head
  p2 = head

  while p1 && p2 && p2.next
    p1 = p1.next
    p2 = p2.next.next
    break if p1 == p2
  end

  p1 = head

  while p1 != p2
    p1 = p1.next
    p2 = p2.next
  end

  return p1
end

puts find_loop_start(a)

def catalan_number(n)
  fact(2 * n) / (fact(n + 1) * fact(n))
end

def fact(n, prod = 1)
  return prod if n <= 1
  fact(n - 1, n * prod)
end

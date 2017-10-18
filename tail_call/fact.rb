def factorial(num, prod = 1)
  return prod if num == 1
  return factorial(num - 1, prod * num)
end

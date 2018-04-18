def fib_recursive(n)
  return n if n <= 1
  return fib_recursive(n-1) + fib_recursive(n-2)
end
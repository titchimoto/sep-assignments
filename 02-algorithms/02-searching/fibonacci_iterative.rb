    def fib_iterative(n)
      puts 0 if n == 0
      fib_0 = 0
      fib_1 = 1
    
      (n - 1).times do
          temp = fib_0
          fib_0 = fib_1
          fib_1 = fib_1 + temp
      end
      return fib_1
    end
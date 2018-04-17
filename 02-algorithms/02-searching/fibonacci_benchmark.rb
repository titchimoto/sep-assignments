require 'benchmark'
require_relative 'fibonacci_recursive'
require_relative 'fibonacci_iterative'

puts Benchmark.measure { puts fib_iterative(20) }

puts Benchmark.measure { puts fib_recursive(20) }


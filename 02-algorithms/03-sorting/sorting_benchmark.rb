require 'benchmark'
require_relative 'insertion_sort'
require_relative 'selection_sort'
require_relative 'bubble_sort'
require_relative 'merge_sort'
require_relative 'bucket_sort'
require_relative 'quick_sort'
require_relative 'heap_sort'

collection = (1..50).to_a.shuffle!

puts Benchmark.measure { insertion_sort(collection) }

puts Benchmark.measure { selection_sort(collection) }

puts Benchmark.measure { bubble_sort(collection) }

puts Benchmark.measure { merge_sort(collection) }

puts Benchmark.measure { bucket_sort(collection) }

puts Benchmark.measure { quick_sort(collection, 0, collection.size - 1) }

puts Benchmark.measure { heap_sort(collection) }




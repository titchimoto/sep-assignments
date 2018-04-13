require 'benchmark'
require_relative './binary_tree/node'
require_relative './binary_tree/binary_search_tree'
require_relative './min_binary_heap/min_binary_heap'

sample = (1..100000).to_a.shuffle.map do |item| 
    Node.new(item.to_s, item)
end

n = 100000
root = Node.new("50000", 50000)
tree = BinarySearchTree.new(root)
heap = MinBinaryHeap.new()
heap.insert(root)

delete_sample = sample.sample(100000)

Benchmark.bm(7) do |x|
  x.report("Binary Tree Insertion") do 
    n.times do |i| 
        tree.insert(root, sample[i])
    end
  end
  
  x.report("Min Heap Insertion") do 
    n.times do |i| 
        heap.insert(sample[i])
    end
  end
end

Benchmark.bm(7) do |x|
    x.report("Binary Tree Find 50000th Element") do
        n/2.times do |i|
            tree.find(root, delete_sample[i].title)
        end
    end

    x.report("Heap Tree Find 50000th Element") do
        n/2.times do |i|
            heap.find(delete_sample[i].title)
        end
    end
end

Benchmark.bm(7) do |x|
    x.report("Binary Tree Deletion") do
        n - 1.times do |i|
            tree.delete(root, delete_sample[i].title)
        end
    end
    
    x.report("Min Heap Deletion") do
        n - 1.times do |i|
            heap.delete(delete_sample[i].title)
        end
    end
end
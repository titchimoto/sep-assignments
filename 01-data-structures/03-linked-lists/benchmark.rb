require 'benchmark'
require_relative 'node'
require_relative 'linked_list'

times = 10000
arr = []
llist = LinkedList.new

Benchmark.bm(7) do |x|
  x.report("Create Array") do
      for n in 1..times; 
        arr[n] = [n] 
    end
end 
  x.report("Create LinkedList") do
      for n in 1..times do
        node = Node.new(n)
        llist.add_to_tail(node)
      end
    end 
end

Benchmark.bm(7) do |x|
    x.report("Find 5000th Item Array") do
        arr[4999]
  end 
    x.report("Find 5000th Item LinkedList") do
        current_node = llist.head
        (1..5000).each do |n|
            current_node = current_node.next
        end
    end 
end

Benchmark.bm(7) do |x|
    x.report("Remove 5000th Item Array") do
        arr.delete_at(4999)
  end 
    x.report("Remove 5000th Item LinkedList") do
        current_node = llist.head
        (1..5000).each do |n|
            current_node = current_node.next
        end
        llist.delete(current_node)
      end 
end


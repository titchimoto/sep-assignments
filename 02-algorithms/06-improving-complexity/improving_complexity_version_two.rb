require 'benchmark'
 
# Improving time complexity using existing merge sort algorithm created in previous assignment.
# Replaced ineffecient insertion sort (O(n^2)) with the more efficient merge sort algorithm (O(nlogn))
# in order to improve time complexity in worst case scenario. Previous code optimizations kept in place.
def better_written_ruby(*arrays)
  combined_array = []
  arrays.each do |array|
      combined_array += array
  end
  merge_sort(combined_array)
end

def merge_sort(collection)
  if collection.length <= 1
    collection
  else
    mid = (collection.length / 2).floor
    left = merge_sort(collection[0..mid - 1])
    right = merge_sort(collection[mid..collection.length])
    merge(left, right)
  end
end
 
def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left[1..left.length], right)
  else
    [right.first] + merge(left, right[1..right.length])
  end
end



data, data1, data2 = (0..10).to_a.shuffle, (11..20).to_a.shuffle, (21..30).to_a.shuffle
puts Benchmark.measure { better_written_ruby(data, data1, data2) }

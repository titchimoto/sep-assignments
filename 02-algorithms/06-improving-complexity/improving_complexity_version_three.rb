require 'benchmark'

# In order to attempt to improve the space complexity of this algorithm, I made a
# few noticeable changes. The first being, I used the built in ruby .flatten! method
# to flatten the array in place. Then, I used a previous implementation of the bubble
# sort algorithm in an effort to sort the array in place, removing the need for an
# extra array used in the other algorithms. For a large data set, essentially halfing the
# required array memory space could be a significant space complexity improvement.

def better_written_ruby(*arrays)
  flat_array = arrays.flatten!
  sorted_array = bubble_sort(flat_array)
end

# Using implementation of bubble sort from a previous assignment.
def bubble_sort(collection)
  n = collection.length
  begin
    swapped = false

    (n - 1).times do |i|
      if collection[i] > collection[i + 1]
        tmp = collection[i]
        collection[i] = collection[i + 1]
        collection[i + 1] = tmp
        swapped = true
      end
    end
  end until not swapped
  collection
end


data, data1, data2 = (0..10).to_a.shuffle, (11..20).to_a.shuffle, (21..30).to_a.shuffle
puts Benchmark.measure { better_written_ruby(data, data1, data2) }

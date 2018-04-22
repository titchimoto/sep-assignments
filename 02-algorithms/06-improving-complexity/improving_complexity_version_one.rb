require 'benchmark' 

# Without using built in ruby methods...
def better_written_ruby(*arrays)
    combined_array = []
    # remove one loop and simply concatenate the arrays.
    arrays.each do |array|
        combined_array += array
    end
 
    sorted_array = [combined_array.delete_at(combined_array.length-1)]
 
    for val in combined_array
      i = 0
      while i < sorted_array.length
        if val < sorted_array[i]
          sorted_array.insert(i, val)
          break
        elsif i == sorted_array.length - 1
          sorted_array << val
          break
        end
        i+=1
      end
    end
  sorted_array
end


# Not sure this counts? Did it using the obvious built in ruby methods...
def better_with_ruby_methods(*arrays)
    combined_array = arrays.flatten!.sort!
end


data, data1, data2 = (0..10).to_a.shuffle, (11..20).to_a.shuffle, (21..30).to_a.shuffle
puts Benchmark.measure { better_with_ruby_methods(data, data1, data2) }
puts Benchmark.measure { better_written_ruby(data, data1, data2) }
  

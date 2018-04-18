def bucket_sort(array)
    bucket_array = Array.new(10)
    divider = ((array.max + 1).to_f / bucket_array.size).to_f.ceil
    i = 0

    while i < array.length
        new_index = array[i]/divider

        if bucket_array[new_index].nil?
          bucket_array[new_index] = [array[i]]
        else
          bucket_array[new_index] << array[i]
        end
        i += 1
    end
    
    sorted_array = []
    bucket_array.each do |item|
        next unless item
        sorted_array << insertion_sort(item)
    end
    sorted_array.flatten
end

def insertion_sort(collection)
    sorted_collection = [collection.delete_at(0)]
 
    for val in collection
      sorted_collection_index = 0
      while sorted_collection_index < sorted_collection.length
        if val <= sorted_collection[sorted_collection_index]
          sorted_collection.insert(sorted_collection_index, val)
          break
        elsif sorted_collection_index == sorted_collection.length - 1
          sorted_collection.insert(sorted_collection_index + 1, val)
          break
        end
 
        sorted_collection_index += 1
      end
    end
    sorted_collection
  end

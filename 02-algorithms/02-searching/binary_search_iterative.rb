def binary_search(collection, target)
    low = 0
    high = collection.size - 1
    
    while low <= high
      mid = (low + high) / 2
      if collection[mid] > target
        high = mid - 1
      elsif collection[mid] < target
        low = mid + 1
      else
        return mid
      end
    end
end




puts binary_search(["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K"], "J")
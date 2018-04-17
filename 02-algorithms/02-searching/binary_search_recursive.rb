def binary_search(collection, target)
    low = 0
    high = collection.size - 1

    return "Item not found." if low > high

    mid = (low + high) / 2

    if collection[mid] == target
        "Item Found!"
    elsif collection[mid] > target
        binary_search(collection[0..mid - 1], target)
    elsif collection[mid] < target
        binary_search(collection[mid + 1..high], target)
    end

end


puts binary_search(["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K"], "C")

puts binary_search(["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K"], "P")
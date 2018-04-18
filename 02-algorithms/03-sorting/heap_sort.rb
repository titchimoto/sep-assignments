def heap_sort(array)
  build_max_heap(array)
  
  last_item = array.length - 1

  while last_item > 0
    swap(array, 0, last_item)
    heapify_down(array, 0, last_item)
    last_item -=1
  end
  array
end

def swap(array, index_one, index_two)
    temp = array[index_one]
    array[index_one] = array[index_two]
    array[index_two] = temp
end

def build_max_heap(array)
  i = array.length/2 - 1
  while i >= 0 do
    heapify_down(array, i, array.size - 1)
    i -= 1
  end
end

def heapify_down(array, i, size)
  while (i < size)
    index = i
    left_child = (2 * i) + 1
    right_child = left_child + 1

    index = left_child if (left_child < size && array[left_child] > array[index])
    index = right_child if (right_child < size && array[right_child] > array[index])
    
    index == i ? return : swap(array, i, index)
    i = index
    end
  end

def quick_sort(array, low_index, high_index)
  if (low_index < high_index)
      sub = partition(array, low_index, high_index)
      quick_sort(array, low_index, sub - 1)
      quick_sort(array, sub + 1, high_index)
  end
  array
end

def swap (array, first_index, second_index)
  temp = array[first_index]
  array[first_index] = array[second_index]
  array[second_index] = temp
end

def partition(array, low_index, high_index)
  pivot = array[high_index]
  current_index = low_index
  i = low_index
  while i < high_index do
    if array[i] <= pivot
      swap(array, i, current_index)
      current_index += 1
    end
    i += 1
  end
  swap(array, high_index, current_index)
  current_index
end
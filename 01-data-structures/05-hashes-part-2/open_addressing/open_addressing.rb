require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @item_count = 0
  end
  

  def []=(key, value)
    i = index(key, @items.size)

    if next_open_index(i) == -1
      self.resize
      index = next_open_index(i)
      @items[index] = Node.new(key, value)
      @item_count += 1
    else
      index = next_open_index(i)
      @items[index] = Node.new(key, value)
      @item_count += 1
    end
    
  end

  def [](key)
    i = index(key, @items.size)
    while @items[i].key != key
      i += 1
    end
    @items[i].value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    while @items[index]
      index += 1
    end
    index == @items.size ? -1 : index
  end

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end

  # Resize the hash
  def resize
    prev_array = @items
    @items = Array.new(prev_array.size * 2)

    prev_array.each do |item|
      if item
        @items[index(item.key, size)] = item
      end
    end
   end

   def print
    puts "There are currently #{@item_count} items out of #{@items.size} spaces in the hash, with a load factor of #{load_factor}"
    
    puts "These are the items in the hash as 'key: value' pairs: "

    @items.each do |item|
      if item
        puts "#{item.key}: #{item.value}"
      end
   end
  end

  def load_factor
    return @item_count.to_f / @items.size.to_f
  end

end
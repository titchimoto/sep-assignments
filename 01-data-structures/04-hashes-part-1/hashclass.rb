class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    i = index(key, @items.size)

    if !@items[i]
      @items[i] = HashItem.new(key, value)
    elsif @items[i].key == key && @items[i].value != value
      self.resize
    elsif @items[i].key != key
      self.resize
      self[key] = value
    end
    @items.size
    @items
  end

  def [](key)
    i = index(key, @items.size)
    @items[i].value
  end

  def resize
    prev_array = @items
    @items = Array.new(prev_array.size * 2)

    prev_array.each do |item|
      if item
        @items[index(item.key, size)] = item
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end
  
end
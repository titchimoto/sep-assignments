require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
    @item_count = 0
    @size = size
  end

  def []=(key, value)
    i = index(key, size)

    if @items[i].nil?
      @items[i] = LinkedList.new
    end
 
    @items[i].add_to_front(Node.new(key, value))
    @item_count += 1

    if load_factor > @max_load_factor
      self.resize
    end
  end

  def [](key)
    i = index(key, size)

    current_node = @items[i].head

    while current_node.key != key
      current_node = current_node.next
    end
    current_node.value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    @item_count.to_f / @size.to_f
  end

  # Simple method to return the number of items in the hash
  def size
    @size
  end

  # Resize the hash
  def resize
    @size *= 2
    @item_count = 0
    old_arr = @items
    @items = Array.new(@size)
    old_arr.each do |item|
      next unless item
      current = item.head
      while current.next
        self[current.key] = current.value
        current = current.next
      end
      self[current.key] = current.value
    end
  end

  def print
    puts "There are currently #{@item_count} items out of #{size} spaces in the hash, with a load factor of #{load_factor}"
    
    puts "These are the items in the hash as 'key: value' pairs: "
    if @item_count === 0
      puts "There are currently no items to display."
    end

    @items.each do |item|
      if item
        current_node = item.head
        while current_node
          puts "#{current_node.key}: #{current_node.value}"
          current_node = current_node.next
        end
      end
    end
  end



end

require_relative 'node'

class MinBinaryHeap
    attr_accessor :items
    attr_accessor :item_map

  def initialize
    @items = Array.new
    @item_map = Hash.new
  end

  def insert(node)
    @items << node
    @item_map[node.title] = @items.size - 1
    heap_up(@items.size - 1)
  end

  def find(data)
    nil if data.nil?
    item_position = @item_map[data]
    return unless item_position
    @items[item_position]
  end

  def delete(data)
    item_position = @item_map[data]
    unless item_position.nil?
        exchange(item_position, @items.size - 1)
        item_to_remove = @items.pop
        @item_map.delete(item_to_remove.title)
        heap_down(item_position)
        item_to_remove
    end
  end

  def printf
    @items.each do |item|
        next unless item
        puts "#{item.title}: #{item.rating}"
    end
  end

  private

  def exchange(index_one, index_two)
    temp_item1 = @items[index_one]
    temp_item2 = @items[index_two]

    temp_map1 = @item_map[temp_item1.title]
    temp_map2 = @item_map[temp_item2.title]

    @items[index_one] = temp_item2
    @items[index_two] = temp_item1

    @item_map[temp_item1] = temp_map2
    @item_map[temp_item2] = temp_map1
  end

  def heap_up(index)
    parent_index = index / 2
    return if index <= 0
    return if @items[index].rating >= @items[parent_index].rating
    exchange(index, parent_index)
    heap_up(parent_index)
  end


  def heap_down(index)
    child_index = index * 2
    return if child_index > @items.size - 1
    not_last_item = child_index < @items.size - 1
    left_item = @items[child_index].rating
    right_item = @items[child_index + 1].rating
    child_index + 1 if not_last_item && right_item < left_item
    return if @items[index].rating <= @items[child_index].rating
    exchange(index, child_index)
    heap_down(child_index)
  end
  
end


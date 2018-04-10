require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # def initialize
  #   @head = nil
  #   @tail = nil
  # end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    current_node = @head

    if !@head && !@tail
      @head = node
      @tail = node
    else
      while current_node.next
        current_node = current_node.next
      end
      current_node.next = node
      @tail = node
      @tail.next = nil
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    current_node = @head
    
    if !@tail
      nil
    elsif @head == @tail
      @head = nil
      @tail = nil
    else
      while current_node.next && current_node.next != @tail
        current_node = current_node.next
      end
    @tail = current_node
    @tail.next = nil
    end
  end

  # This method prints out a representation of the list.
  def print
    current_node = @head

    puts current_node.data

    while current_node.next
      current_node = current_node.next
      puts current_node.data
    end
    

  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    current_node = @head

    if node == @head
      remove_front
    elsif node == tail
      remove_tail
    else
      while current_node.next != node
        current_node = current_node.next
      end

      current_node.next = node.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if @head
      node.next = @head
      @head = node
    else
      @head = node
      @tail = node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if @head
      temp_head = @head
      @head = @head.next
      return @head
    else
      return nil
    end
  end

end
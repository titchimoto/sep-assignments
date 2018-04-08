class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    set_head_tail
  end

  def enqueue(element)
    @queue += [element]
    set_head_tail
    @queue
  end

  def dequeue
    element = @queue[-1]
    @queue -= [element]
    set_head_tail
    element
  end

  def empty?
    @queue.size === 0
  end

  private

  def set_head_tail
    @head = @queue[0]
    @tail = @queue[-1]
  end
end

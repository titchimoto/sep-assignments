class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack += [item]
    self.top = @stack[-1]
  end

  def pop
    item = @stack[-1]
    @stack -= [item]
    self.top = @stack[-1]
    item
  end

  def empty?
    @stack.size === 0
  end
end

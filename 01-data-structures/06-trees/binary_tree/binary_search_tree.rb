require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root.nil?
      root = node
    elsif node.rating < root.rating
      root.left = insert(root.left, node)
    else
      root.right = insert(root.right, node)
    end
    root

  end

  # Recursive Depth First Search
  def find(root, data)
    if root.nil?|| data.nil?
      nil
    else
      if root.title == data
        root
      elsif root.left
        find(root.left, data)
      elsif root.right
        find(root.right, data)
      end
    end
  end

  def delete(root, data)
      result = find(root, data)
      result.nil? ? nil : (result.title = nil && result.rating = nil)
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    results = Queue.new
    results.enq(@root)

    while !results.empty?
      node = results.deq
    
      puts "#{node.title}: #{node.rating}" if node.title 

      results.enq(node.left) if node.left
      results.enq(node.right) if node.right
    end
  end
  
end
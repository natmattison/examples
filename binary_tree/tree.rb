class Tree
  attr_accessor :value
  attr_accessor :left
  attr_accessor :right
  
  def initialize(value)
    @value = value
  end
  
  def insert_left(value)
    @left = Tree.new(value)
  end
  
  def insert_right(value)
    @right = Tree.new(value)
  end

  def is_leaf
    return !@left && !@right
  end

  def is_valid_bst(left_bound=nil, right_bound=nil)
    left_bound = left_bound || nil
    right_bound = right_bound || nil
    bounds_valid = (left_bound ? @value > left_bound : true) && (right_bound ? @value < right_bound : true)

    return false unless bounds_valid

    left_valid = @left ? @left.is_valid_bst(left_bound, value) : true
    right_valid = @right ? @right.is_valid_bst(value, right_bound) : true

    return left_valid && right_valid

  end

  def search(value)
    if @value == value
      return true
    elsif @value < value && @right
      return @right.search(value) 
    elsif @value > value && @left
      return @left.search(value)
    end
    
    return false
  end

  def print
    @left.print if @left
    @right.print if @right
    # @left.print if @left
  end
  
end

class BinarySearchTree
  attr_accessor :head
  
  def initialize(array)
    array.sort!
    create(array)
  end
  
  def create(array)    
    if array.length == 1
      @head = Tree.new(array[0])
      return
    elsif array.length == 0
      return nil
    end
    
    middle_index = array.length/2

    @head = Tree.new(array[middle_index])
    @head.left = BinarySearchTree.new(array[0..middle_index - 1]).head
    @head.right = BinarySearchTree.new(array[middle_index + 1..array.length - 1]).head
  end
  
  def search(value)
    @head.search(value)
  end
  
  def print
    @head.print()
  end

end

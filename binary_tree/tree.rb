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
  
end
 
 
 
 

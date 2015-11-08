require_relative '../tree'

describe "#is_valid_bst" do

  context "tree" do

    it "finds an valid tree - single leaf" do
      t = Tree.new(10)
      
      expect(t.is_valid_bst()).to eq(true)
    end

    it "finds an valid tree - small" do
      t = Tree.new(10)
      t.insert_left(8)
      t.insert_right(13)
      
      expect(t.is_valid_bst()).to eq(true)
    end
    
    it "finds a valid tree - large" do
      t = Tree.new(10)
      l = t.insert_left(6)
      r = t.insert_right(13)
      l.insert_left(3)
      l.insert_right(8)
      r.insert_left(11)
      r.insert_right(15)
      
      expect(t.is_valid_bst()).to eq(true)
    end

    it "finds an invalid tree - small" do
      t = Tree.new(10)
      t.insert_left(11)
      t.insert_right(13)
      
      expect(t.is_valid_bst()).to eq(false)
    end

    it "finds an invalid tree - large" do
      t = Tree.new(10)
      l = t.insert_left(6)
      r = t.insert_right(13)
      l.insert_left(3)
      l.insert_right(8)
      r.insert_left(9)
      r.insert_right(15)
      
      expect(t.is_valid_bst()).to eq(false)
    end

  end
  
  describe "binary search tree" do
    
    let(:bst) {
      array = [4, 5, 1, 10, 7]
      BinarySearchTree.new(array)
    }
    
    it "gets created from an array" do
      expect(bst.head.value).to eq(5)
      expect(bst.head.is_valid_bst).to eq(true)
    end

    it "can be searched" do
      expect(bst.search(4)).to eq(true)
      expect(bst.search(5)).to eq(true)
      expect(bst.search(7)).to eq(true)
      expect(bst.search(10)).to eq(true)
      expect(bst.search(1)).to eq(true)
    end
    
    it "can fail with searching for elements not there" do
      expect(bst.search(99)).to eq(false)
    end
    
    it "works with array with an even number of elements" do
      array = [4, 5, 1, 10, 7, 12]
      bst = BinarySearchTree.new(array)
      expect(bst.head.is_valid_bst).to eq(true)
      expect(bst.search(12)).to eq(true)
      expect(bst.search(1)).to eq(true)
    end
    
  end

end

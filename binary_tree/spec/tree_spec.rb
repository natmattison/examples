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

end

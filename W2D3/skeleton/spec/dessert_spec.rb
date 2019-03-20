require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) do 
    Dessert.new("carrot cake", 3, chef)
  end

  describe "#initialize" do
    it "sets a type" do 
      expect(dessert.type).to eq("carrot cake")
    end
    it "sets a quantity" do 
      expect(dessert.quantity).to eq(3) 
    end
    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end 
    it "raises an argument error when given a non-integer quantity" do 
      expect { Dessert.new("carrot cake", "a", "Paul Hollywood") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do 
      dessert.add_ingredient("flour")
      expect(dessert.ingredients).to eq(["flour"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do 
      dessert.add_ingredient("flour")
      dessert.add_ingredient("water")
      dessert.add_ingredient("eggs")
      dessert.add_ingredient("carrots")
      dessert.add_ingredient("butter")
      ingredients_copy = dessert.ingredients.dup 
      dessert.mix!
      expect(dessert.ingredients).not_to eq(ingredients_copy)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do 
      dessert.eat(1)
      expect(dessert.quantity).to eq(2)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(5) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Paul Hollywood the Great Baker")
      expect { dessert.serve }.to_not raise_exception
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do 
      expect(chef).to receive(:bake).with(dessert)
      chef.bake(dessert)
    end
  end
end

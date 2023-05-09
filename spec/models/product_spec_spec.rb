require 'rails_helper'

RSpec.describe ProductSpec, type: :model do
 describe "validations" do
    before (:all) do
      @category = Category.new(name: "Tree")
      @product = Product.new(name: "Money tree", price: 55, quantity: 20, category: @category)
    end
    
    it "Saves a new product with all attributes" do 
      expect(@product).to be_valid
    end

    it "name should not be blank" do 
      expect(@product.name).to eq("Money tree")

      @product.name = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq(["Name can't be blank"])
    end
    
    it "price should not be blank" do
      @product.price = nil
      expect(@product).to_not be_valid
      
    end

    it "quantity should not be blank" do
      @product.quantity = nil
      expect(@product).to_not be_valid
    end

    it "category should not be blank" do
      @product.category = nil
      expect(@product).to_not be_valid
    end
  end
end

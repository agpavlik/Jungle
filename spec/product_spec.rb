require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before do
      @category = Category.create(name: 'Evergreens')
    end

    it "all 4 fields are filled in and save" do
      @product = Product.new(name: 'Enirthelda', price: 124.99, quantity: 8, category: @category)
      expect(@product.save). to be true
    end

    it "name is present" do
      @product = Product.new(name: 'Enirthelda', price: 124.99, quantity: 8, category: @category)
      expect(@product.name). not_to be nil
    end

    it "price is present" do
      @product = Product.new(name: 'Enirthelda', price: 124.99, quantity: 8, category: @category)
      expect(@product.price). not_to be nil
    end

    it "quantity is present" do
      @product = Product.new(name: 'Enirthelda', price: 124.99, quantity: 8, category: @category)
      expect(@product.quantity). not_to be nil
    end

    it "category is not present" do
      @product = Product.new(name: 'Enirthelda', price: 124.99, quantity: 8, category: nil)
      expect(@product.save). to be false
    end

  end
end
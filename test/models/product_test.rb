#encoding: UTF-8
require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  test 'product can be created with correct attributes' do
    assert_difference("Product.count", 1) do
      FactoryGirl.create :product
    end
  end

  test 'title cannot be blank' do
    product = Product.new
    assert_no_difference('Product.count') do
      product.save
    end
    assert product.errors[:title].include?("nie może być puste"), 
      "Brak wiadomości: nie może być puste"
  end

  test 'title must be at least 4 characters long' do
    product = Product.new
    assert_no_difference('Product.count') do
      product.save
    end
    assert product.errors[:title].include?("is too short (minimum is 4 characters)")
  end

  test 'description cannot be blank' do
    product = Product.new
    assert_no_difference('Product.count') do
      product.save 
    end
    assert_equal ["can't be blank"], product.errors[:description]
  end

  test 'price cannot be blank' do
    assert_no_difference('Product.count') do
      product = Product.new
      product.save
      assert_equal ["can't be blank"], product.errors[:price]
    end
  end

  test 'product can be deleted' do
    product = FactoryGirl.create :product
    assert_difference("Product.count", -1) do
      product.delete
    end
  end

  test "title must be uniq" do
    hobbit = FactoryGirl.create(:product)
    product = Product.new
    product.title = hobbit.title
    product.price = 10
    product.description = "Drugi produkt"

    assert_no_difference("Product.count") do
      product.save
    end
    assert_equal ["has already been taken"], product.errors[:title]
  end

end


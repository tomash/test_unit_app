require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  test 'product can be created with title' do
    product = Product.new
    product.title = "Woda ognista, a życie dzikich"
    product.price = "price"
    assert_difference("Product.count", 1) do
      product.save
    end
  end

  test 'title cannot be blank' do
    product = Product.new
    assert_no_difference('Product.count') do
      product.save
    end
    assert_equal ["can't be blank"], product.errors[:title]
  end

  test 'price cannot be blank' do
    assert_no_difference('Product.count') do
      product = Product.new
      product.save
      assert_equal ["can't be blank"], product.errors[:price]
    end
  end

  test 'product can be deleted' do
    product = Product.new
    product.title = "Woda ognista, a życie dzikich"
    product.price = "price"

    assert_difference('Product.count', 1) do
      product.save
    end

    assert_difference('Product.count', -1) do
      product.delete
    end
  end

end


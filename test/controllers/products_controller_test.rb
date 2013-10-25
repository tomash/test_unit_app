require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  test "show displays product" do
    get :show, id: products(:harry_potter).id
    assert_response :success
    assert_template :show
    assert_equal products(:harry_potter), assigns(:product)
  end

  test "create saves product in db" do
    assert_difference('Product.count', 1) do
      post :create, product: FactoryGirl.attributes_for(:product)
    end
    assert_response :redirect
    assert_redirected_to product_path(assigns(:product))
  end

  test "product is not created without title" do
    assert_no_difference('Product.count') do
      post :create, product: FactoryGirl.attributes_for(:product, 
                                                        title: nil)
    end
    assert_response :success
    assert_template :new
    assert_equal 'Tam i z powrotem', assigns(:product).description
  end

  test "index shows all products" do
    get :index
    assert_response :success
    assert_template :index
    assert_equal 2, assigns(:products).size
  end

  test "update changes title" do
    patch :update, id: products(:harry_potter).id,
                   product: { title: "Gra Endera" }
    assert_response :redirect
    assert_equal 'Gra Endera', 
                 Product.find(products(:harry_potter).id).title
    assert_redirected_to product_path(assigns(:product))
  end
end

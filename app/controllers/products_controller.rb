class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def index
    @products = Product.all
  end

  def update
    @product = Product.find(params[:id])
    @product.update_attributes(product_params)
    redirect_to product_path(@product)
  end

  def product_params
    params.require(:product).permit(:title, :price, :description)
  end
end

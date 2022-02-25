class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :product_explanation, :category_id, :product_status_id, :shipping_charge_id, :shipping_area_id, :ship_id, :price) 
  end
  
end

class ProductsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @products = Product.order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :product_explanation, :category_id, :product_status_id, :shipping_charge_id,
                                    :shipping_area_id, :ship_id, :price, :image).merge(user_id: current_user.id)
  end
end

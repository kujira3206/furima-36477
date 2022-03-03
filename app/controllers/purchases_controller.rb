class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @purchase_shipping_address = PurchaseShippingAddress.new
    @product = Product.find(params[:product_id])
    if current_user.id == @product.user_id
      redirect_to root_path
    elsif @product.purchase.present? 
      redirect_to root_path
    end
  end

  def create
    @purchase_shipping_address = PurchaseShippingAddress.new(purchase_params)
       @product = Product.find(params[:product_id])
    if @purchase_shipping_address.valid?
      pry_item
      @purchase_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping_address).permit(:zip_code, :shipping_area_id, :minicipalities, :block_number, :building, :tel).merge(
      user_id: current_user.id, product_id: params[:product_id], token: params[:token]
    )
  end

  def pry_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end

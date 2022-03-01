class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @purchase_shipping_address = PurchaseShippingAddress.new
  end

  def create
    @purchase_shipping_address = PurchaseShippingAddress.new(purchase_params)
    if @purchase_shipping_address.valid?
      @purchase_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:product).permit(:zip_code, :shipping_area_id, :minicipalities, :block_number, :building, :tel, ).merge(user_id: current_user.id, product_id: params[:product_id] )
  end
  

end

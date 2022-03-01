class PurchasesController < ApplicationController

  def index
    @purchase_shipping_address = PurchaseShippingAddress.new
  end

  def create
    @purchase_shipping_address = PurchaseShippingAddress.new(purchase_params)
    # if @purchase_shipping_address.valid?
    #   @purchase_shipping_address.save
    #   redirect_to root_path
    # else
    #   render :new
    # end
  end

  private

  def purchase_params
    params.require(:purchase_shipping_address).permit(:zip_code, :shipping_area_id, :minicipalities, :block_number, :building, :tel, :product_id ).merge(user_id: current_user.id )
  end
  

end

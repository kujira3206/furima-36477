class PurchaseShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :zip_code, :shipping_area, :minicipalities, :block_number, :building, :tel, 
  
  with_options presence: true do


end
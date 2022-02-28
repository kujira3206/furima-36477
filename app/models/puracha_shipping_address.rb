class PurchaseShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :zip_code, :shipping_area, :minicipalities, :block_number, :building, :tel, 
  
  with_options presence: true do
    validates :zip_code,format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_area_id, presence: true
    validates :minicipalities, pressence: true
    validates :block_number, presence: true
    validates :building
    validates :tel, presence: true
    validates :user_id
    validates :product_id
    validates :Purchase_id
  end

  def save
    purchase = Purchase.create(product_id: product_id, user_id: user_id)

    ShippingAddress.create(zip_code: zip_code, shipping_area: shipping_area, minicipalities: minicipalities, block_number: block_number, building: building, purchase_id: purchase.id)
  end


end
class PurchaseShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :zip_code, :shipping_area_id, :minicipalities, :block_number, :building, :tel, :token

  with_options presence: true do
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :minicipalities
    validates :block_number
    validates :tel, format: { with: /\A[0-9]{11}\z/ }
    validates :user_id
    validates :product_id
    validates :token
  end
  validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchase = Purchase.create(product_id: product_id, user_id: user_id)

    ShippingAddress.create(zip_code: zip_code, shipping_area_id: shipping_area_id, minicipalities: minicipalities,
                           block_number: block_number, building: building, tel: tel, purchase_id: purchase.id)
  end
end

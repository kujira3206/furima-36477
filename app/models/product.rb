class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :product_name, presence: true
  validates :product_explanation, presence: true
  validates :category_id, presence: true
  validates :product_status_id, presence: true
  validates :shipping_charge_id, presence: true
  validates :shipping_area_id, presence: true
  validates :ship_id, presence: true
  validates :price, presence: true
  validates :user, presence: true
end

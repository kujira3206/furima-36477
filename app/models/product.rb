class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_status
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :ship
  belongs_to :user
  has_one_attached :image

  validates :product_name, presence: true
  validates :product_explanation, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :product_status_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_charge_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_area_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :ship_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :price, presence: true
  validates :user, presence: true
end

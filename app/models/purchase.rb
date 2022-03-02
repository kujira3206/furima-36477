class Purchase < ApplicationRecord
   has_one :shipping_address
   belongs_to :product_id
   belongs_to :user





end

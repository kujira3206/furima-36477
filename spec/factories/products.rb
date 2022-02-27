FactoryBot.define do
  factory :product do
    product_name {"商品名"}
    product_explanation {"商品説明"}
    category_id {2}
    product_status_id {2}
    shipping_charge_id {2}
    shipping_area_id {2}
    ship_id {2}
    price {"300"}
    association :user 

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

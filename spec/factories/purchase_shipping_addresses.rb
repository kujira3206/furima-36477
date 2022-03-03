FactoryBot.define do
  factory :purchase_shipping_address do
    zip_code { '123-4567' }
    shipping_area_id { 3 }
    minicipalities { 'あ' }
    block_number { 'あ' }
    building { 'あ' }
    tel { 12_345_678_901 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end

class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|

      t.string      :zip_code             , null: false
      t.integer     :shipping_area_id     , null: false
      t.string      :minicipalities       , null: false
      t.string      :bolck_number         , null: false
      t.string      :building         
      t.string      :tel                  , null: false
      t.timestamps
    end
  end
end

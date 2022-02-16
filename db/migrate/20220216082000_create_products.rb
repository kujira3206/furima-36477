class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|

      t.string      :product_name             , null: false
      t.text        :product_explanation      , null: false
      t.integer     :category_id              , null: false
      t.integer     :product_status_id        , null: false
      t.integer     :shipping_charge_id      , null: false
      t.integer     :shipping_area_id         , null: false
      t.integer     :ship_id                  , null: false
      t.integer     :price                    , null: false
      t.references  :shipping_addresses       , null: false
      t.timestamps
    end
  end
end

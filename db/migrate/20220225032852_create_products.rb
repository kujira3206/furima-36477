class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|

      t.string :product_name, null: false
      t.text :product_explanation, null: false
      t.integer :category_id, numericality: { other_than: 1 } 
      t.integer :product_status_id, numericality: { other_than: 1 } 
      t.integer :shipping_charge_id, numericality: { other_than: 1 } 
      t.integer :shipping_area_id, numericality: { other_than: 1 } 
      t.integer :ship_id, numericality: { other_than: 1 } 
      t.integer :price, null:false
      t.references :user, null: false, foreign_kye: true

      t.timestamps
    end
  end
end

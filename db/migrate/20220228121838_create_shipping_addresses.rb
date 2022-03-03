class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|

      t.references :purchase, null: false, foreign_kye: true
      t.string :zip_code, null: false
      t.integer :shipping_area_id, numericality: { other_than: 1 } 
      t.string :minicipalities, null: false
      t.string :block_number, null: false
      t.string :building
      t.string :tel, null: false



      t.timestamps
    end
  end
end

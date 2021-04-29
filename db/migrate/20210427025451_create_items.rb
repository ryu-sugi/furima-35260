class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :email,               null: false, default: ""
      t.string :encrypted_password,  null: false, default: ""

      t.string :item,                null: false
      t.string :item_image,          null: false
      t.integer :category_id,        null: false
      t.string :value,               null: false
      t.string :description,         null: false
      t.integer :condition_id,       null: false
      t.integer :shipping_cost_id,   null: false
      t.integer :shipping_area_id,   null: false
      t.integer :shipping_day_id ,   null: false
      t.date :user,                  null: false
      
      t.timestamps
    end
  end
end

class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :email,               null: false, default: ""
      t.string :encrypted_password,  null: false, default: ""

      t.string :item,                null: false
      t.string :item_image,          null: false
      t.string :category_id,         null: false
      t.string :value,               null: false
      t.string :description,         null: false
      t.string :condition_id,        null: false
      t.date :shipping_cost_id,      null: false
      t.date :shipping_area_id,      null: false
      t.date :shipping_day_id ,      null: false
      t.date :user,                  foreign_key: true
      
      t.timestamps
    end
  end
end

class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string :item_name,              null: false
      t.integer :category_id,           null: false
      t.integer :value,                 null: false
      t.text    :description,           null: false
      t.integer :condition_id,          null: false
      t.integer :shipping_cost_id,      null: false
      t.integer :shipping_area_id,      null: false
      t.integer :shipping_day_id ,      null: false
      t.integer :user_id,               null: false
      
      t.timestamps
    end
  end
end

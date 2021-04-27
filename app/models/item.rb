class Item < ApplicationRecord

 with_options presence: true do
  validates :item
  validates :category_id 
  validates :value
  validates :description
  validates :condition_id
  validates :shipping_cost_id
  validates :shipping_area_id
  validates :shipping_day_id
 end

 belongs_to :user
 has_one_attached :image
end

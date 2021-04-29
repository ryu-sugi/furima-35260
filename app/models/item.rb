class Item < ApplicationRecord

 with_options presence: true do
  validates :item_name
  validates :category_id, numericality: { other_than: 1 }
  validates :value
  validates :description
  validates :condition_id, numericality: { other_than: 1 }
  validates :shipping_cost_id, numericality: { other_than: 1 }
  validates :shipping_area_id, numericality: { other_than: 1 }
  validates :shipping_day_id, numericality: { other_than: 1 }
 end

 belongs_to :user
 has_one_attached :image

 extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :shipping_area, :shipping_cost, :shipping_day
end

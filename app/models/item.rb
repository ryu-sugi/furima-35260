class Item < ApplicationRecord
  with_options presence: true do
    validates :item_name
    validates :value, format: { with: /\A[0-9]+\z/ },
                      numericality: { only_integer: true, greater_than_or_equal_to: 299, less_than_or_equal_to: 10_000_000 }
    validates :description
    validates :image
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :shipping_cost_id
      validates :shipping_area_id
      validates :shipping_day_id
    end
  end

  belongs_to       :user
  has_one_attached :image
  has_one          :buy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_area
  belongs_to :shipping_cost
  belongs_to :shipping_day
end

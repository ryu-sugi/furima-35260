class ShippingAddress < ApplicationRecord
 with_options presence: true do
  validates :postal_code
  validates :shipping_area_id
  validates :town
  validates :address
  validates :phone
 end
  validates :building_name
  belongs_to :buy
end

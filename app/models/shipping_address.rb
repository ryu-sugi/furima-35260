class ShippingAddress < ApplicationRecord
 with_options presence: true do
  validates :postal_code
  validates :shipping_area_id
  validates :town
  validates :address
  validates :phone
 end
 
  belongs_to :buy
end

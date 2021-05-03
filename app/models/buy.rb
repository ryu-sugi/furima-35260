class Buy < ApplicationRecord
 belongs_to :user
 belongs_to :item
 has_one    :shipping_address
 
 has_one_attached :image
end

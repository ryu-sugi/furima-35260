class BuyAddress
 include ActiveModel::Model
 attr_accessor :user_id, :item_id, :postal_code, :shipping_area_id, :town, :building_name, :address, :phone

  with_options presence: true do
   validates :user_id
   validates :item_id
   validates :postal_code
   validates :shipping_area_id
   validates :town
   validates :address
   validates :phone
  end
   

  def save

    buy = Buy.create(item_id: item_id, user_id: user_id)

    ShippingAddress.create(postal_code: postal_code, shipping_area_id: shipping_area_id, town: town, address: address, building_name: building_name, phone: phone, buy_id: buy.id)
  end
end
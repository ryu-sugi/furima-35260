class BuyAddress
 include ActiveModel::Model
 attr_accessor :user_id, :item_id, :shipping_cost_id, :postal_code, :shipping_area_id, :town, :building_name, :address, :phone

  with_options presence: true do
   validates :user_id
   validates :item_id
   validates :shipping_cost_id
   validates :postal_code
   validates :shipping_area_id
   validates :town
   validates :address
   validates :phone
  end
   

  def save
    buy = Buy.create(value: value, user_id: user_id)

    Address.create(postal_code: postal_code, shipping_area_id: shipping_area.id, town: town, address: address, building_name: building_name, phone: phone, item_id: item.id)
  end
end
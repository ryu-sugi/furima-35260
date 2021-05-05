class BuyAddress
  attr_accessor :token, :user_id, :item_id, :postal_code, :shipping_area_id, :town, :building_name, :address, :phone

  include ActiveModel::Model

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :town
    validates :address
    validates :phone, numericality: { only_integer: true }, length: { in: 10..11 }
    validates :token
  end

  def save
    buy = Buy.create(item_id: item_id, user_id: user_id)

    ShippingAddress.create(postal_code: postal_code, shipping_area_id: shipping_area_id, town: town, address: address,
                           building_name: building_name, phone: phone, buy_id: buy.id)
  end
end

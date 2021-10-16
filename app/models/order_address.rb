class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :region_id, :city, :block_num, :building_name, :phone_num

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city
    validates :block_num
    validates :phone_num, format: { with: /\A\d{10,11}\z/ }
    validates :region_id, numericality: { other_than: 0 }
    validates :item_id
    validates :user_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, region_id: region_id, city: city, block_num: block_num,
                   building_name: building_name, phone_num: phone_num, order_id: order.id)
  end
end

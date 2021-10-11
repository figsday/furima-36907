class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :region, :city, :block_num, :building_name, :phone_num

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "半角文字を使用してください"}
    validates :city
    validates :block_num
    validates :phone_num, format: {with: /\A\d{10,11}\z/, message: "半角数値を使用してください"}
  end
  validates :region_id, numericality: {other_than: 0, message: "can't be blank"}
  validates :item_id
  validates :user_id

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(:postal_code, :region_id, :city, :block_num, :building_name, :phone_num)
  end
 end
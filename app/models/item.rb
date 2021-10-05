class Item < ApplicationRecord
  belongs_to :user
  has_one    :history
  has_one_attached :image

  validates :user, presence: true
  validates :item_name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_fee_id, presence: true
  validates :region_id, presence: true
  validates :delivery_time_id, presence: true
end
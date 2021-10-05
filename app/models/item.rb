class Item < ApplicationRecord
  belongs_to :user
  has_one    :history
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_time
  belongs_to :region
  belongs_to :shipping_fee

  validates :user,             presence: true
  validates :item_name,        presence: true
  validates :description,      presence: true
  validates :price,            presence: true
  validates :category_id,      presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :condition_id,     presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :shipping_fee_id,  presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :region_id,        presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :delivery_time_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
end
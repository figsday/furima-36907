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

  #validates :user,             presence: true, foreign_key: true
  validates :item_name,        presence: true, length: { maximum: 40 }
  validates :description,      presence: true, length: { maximum: 1000 }
  validates :category_id,      presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :condition_id,     presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :shipping_fee_id,  presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :region_id,        presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :delivery_time_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :image,            presence: true

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      presence: { message: "can't be blank" }
  end
end
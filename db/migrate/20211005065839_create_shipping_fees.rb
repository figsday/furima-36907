class CreateShippingFees < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_fees do |t|
      t.integer  :shipping_fee_id  , null: false
      t.timestamps
    end
  end
end

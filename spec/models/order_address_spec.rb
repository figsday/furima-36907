require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order = FactoryBot.build(:order_address)
  end

  describe '商品購入機能' do
    context '配送先情報が保存できる場合' do
      it '必要な情報が存在すれば保存できる' do
        expect(@order).to be_valid
      end
    end

    context '配送先情報が保存できない場合' do
      it 'tokenが空では保存できない' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空では保存できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は「3桁ハイフン4桁」の半角文字列でないと保存できない' do
        @order.postal_code = '００００００００'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end
      it 'regionが空では保存できない' do
        @order.region_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Region can't be blank")
      end
      it 'cityが空では保存できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'block_numが空では保存できない' do
        @order.block_num = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Block num can't be blank")
      end
      it 'phone_numが空では保存できない' do
        @order.phone_num = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone num can't be blank")
      end
      it '電話番号は10桁以上11桁以内の半角数値でないと保存できない' do
        @order.phone_num = '０９０-1234-5678'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone num is invalid")
      end
    end
  end
end
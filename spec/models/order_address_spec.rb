require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  describe '商品購入機能' do
    context '配送先情報が保存できる場合' do
      it '必要な情報が存在すれば保存できる' do
        expect(@order).to be_valid
      end
      it 'building_nameが空でも保存できる' do
        @order.building_name = ''
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
        expect(@order.errors.full_messages).to include('Postal code is invalid')
      end
      it 'regionが未選択だと出品できない' do
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
        expect(@order.errors.full_messages).to include('Phone num is invalid')
      end
      it '電話番号は9桁以下では保存できない' do
        @order.phone_num = '123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone num is invalid')
      end
      it '電話番号は12桁以上では保存できない' do
        @order.phone_num = '123456789000'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone num is invalid')
      end
      it 'user_idが空では保存できない' do
        @order.user_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では保存できない' do
        @order.item_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

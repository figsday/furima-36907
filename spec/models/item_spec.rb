require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できる場合' do
      it "必要な情報が存在すれば出品できる" do
        expect(@item).to be_valid
      end
    end

    context '商品出品できない場合' do
      it "item_nameが空では出品できない" do
        @item.item_name = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "descriptionが空では出品できない" do
        @item.description = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "priceが空では出品できない" do
        @item.price = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "category_idが空では出品できない" do
        @item.category_id = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "condition_idが空では出品できない" do
        @item.condition_id = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "shipping_fee_idが空では出品できない" do
        @item.shipping_fee_id = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it "region_idが空では出品できない" do
        @item.region_id = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end
      it "delivery_time_idが空では出品できない" do
        @item.delivery_time_id = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank")
      end
      it 'imageが空では出品できない'do
        @item.image = nil
        @item.valid?
        expect(@item.errors[:image]).to include("can't be blank")
      end

      it "販売価格が¥300より少ない場合は出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "販売価格が¥9,999,999より多い場合は出品できない" do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "価格は半角数値でなければ登録できない" do
        @item.price ='１２３'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
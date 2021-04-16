require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品情報入力' do
    context '商品情報入力がうまくいく時' do
      it '全ての値が正しく入力されていれば出品できること' do
        expect(@item).to be_valid
      end
    end
    context '商品情報の入力がうまくいかない時' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'explanationが空だと出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idが未選択だと出品できない' do
        @item.category_id = [0]
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it 'condition_idが未選択だと出品できない' do
        @item.condition_id = [0]
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is not a number")
      end
      it 'delivery_fee_idが未選択だと出品できない' do
        @item.delivery_fee_id = [0]
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee is not a number")
      end
      it 'area_idが未選択だと出品できない' do
        @item.area_id = [0]
        @item.valid?
        expect(@item.errors.full_messages).to include("Area is not a number")
      end
      it 'delivery_day_idが未選択だと出品できない' do
        @item.delivery_day_id = [0]
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day is not a number")
      end
      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number")
      end
      it 'priceが全角数字だと出品できない' do
        @item.price = "３０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが設定範囲以外だと出品できない' do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
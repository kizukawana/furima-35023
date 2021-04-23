require 'rails_helper'
RSpec.describe ItemUserInformation, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @item_user_information = FactoryBot.build(:item_user_information, user_id: @user.id, item_id: @item.id)
    sleep(3)
  end
  describe '商品購入登録' do
        context '商品購入できるとき' do
            it '全ての情報が入力されていなければ登録できる' do
                expect(@item_user_information).to be_valid
            end
            it '建物名がなくても登録できる' do
                @item_user_information.building_name = nil
                expect(@item_user_information).to be_valid
            end
        end
        context '購入登録ができないとき' do
            it '郵便番号が空では登録できない' do
                @item_user_information.postal_code = ''
                @item_user_information.valid?
                expect(@item_user_information.errors.full_messages).to include("Postal code can't be blank")
            end
            it '都道府県が空では登録できない' do
                @item_user_information.prefecture_id = ''
                @item_user_information.valid?
                expect(@item_user_information.errors.full_messages).to include("Prefecture can't be blank")
            end
            it '市区町村が空では登録できない' do
                @item_user_information.municipality = ''
                @item_user_information.valid?
                expect(@item_user_information.errors.full_messages).to include("Municipality can't be blank")
            end
            it '番地が空では登録できない' do
                @item_user_information.address = ''
                @item_user_information.valid?
                expect(@item_user_information.errors.full_messages).to include("Address can't be blank")
            end
            it '電話番号が空では登録できない' do
                @item_user_information.phone_number = ''
                @item_user_information.valid?
                expect(@item_user_information.errors.full_messages).to include("Phone number can't be blank")
            end
            it '電話番号は12桁以上では登録できない' do
                @item_user_information.phone_number = 'aaaaaaaaaaaaa'
                @item_user_information.valid?
                expect(@item_user_information.errors.full_messages).to include("Phone number is invalid")
            end
            it '郵便番号の登録にはハイフンがないと登録できない' do
                @item_user_information.postal_code = '0000000'
                @item_user_information.valid?
                expect(@item_user_information.errors.full_messages).to include("Postal code is invalid")
            end
            it '都道府県のidは1は保存することができない' do
                @item_user_information.prefecture_id = 1
                @item_user_information.valid?
                expect(@item_user_information.errors.full_messages).to include("Prefecture must be other than 1")
            end
            it '電話番号は英数混合では登録できない' do
                @item_user_information.phone_number = 'aa23'
                @item_user_information.valid?
                expect(@item_user_information.errors.full_messages).to include("Phone number is invalid")
            end
            it 'tokenが空では登録できない' do
                @item_user_information.token = nil
                @item_user_information.valid?
                expect(@item_user_information.errors.full_messages).to include("Token can't be blank")
            end
            it 'user_idが空では登録できない' do
                @item_user_information.user_id = nil
                @item_user_information.valid?
                expect(@item_user_information.errors.full_messages).to include("User can't be blank")
            end
            it 'item_idが空では登録できない' do
                @item_user_information.item_id = nil
                @item_user_information.valid?
                expect(@item_user_information.errors.full_messages).to include("Item can't be blank")
            end
            it '電話番号は数値以外では登録できない' do
                @item_user_information.phone_number = 'aaaaaaaaaaa'
                @item_user_information.valid?
                expect(@item_user_information.errors.full_messages).to include("Phone number is invalid")
            end
            it '電話番号は英数混合では登録できない' do
                @item_user_information.phone_number = 'aaaaaa11111111'
                @item_user_information.valid?
                expect(@item_user_information.errors.full_messages).to include("Phone number is invalid")
            end
        end
    end
end



















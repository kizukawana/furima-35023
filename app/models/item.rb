class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category    #アクティブハッシュ
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :delivery_day      #アクティブハッシュ
  belongs_to :user
  has_one :lists
  has_one_attached :image

#バリデーション
with_options presence: true do 
    validates :name             #空では登録できない
    validates :explanation      #空では登録できない
    validates :category_id      #空では登録できない
    validates :condition_id     #空では登録できない
    validates :delivery_fee_id  #空では登録できない
    validates :area_id          #空では登録できない
    validates :delivery_day_id  #空では登録できない
    with_options format: { in: 300..9999999} do
     with_options format: {with: /\A[a-z0-9]+\z/i} do
    validates :price            #空では登録できない半角数字(300~9999999)の範囲で追加
     end
    end
    
    
end


end

class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category    #アクティブハッシュ
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :delivery_day      #アクティブハッシュ
  #アソシエーション
  belongs_to :user
  has_one :lists
  has_one_attached :image

#バリデーション
with_options presence: true do #空では登録できない 
    validates :name             
    validates :explanation      
    validates :image
    validates :price,  numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}#空では登録できない半角数字(300~9999999)の範囲で追加
end
with_options  numericality: {other_than:0} do
  validates  :category_id              
  validates  :condition_id             
  validates  :delivery_fee_id     
  validates  :area_id              
  validates  :delivery_day_id      
end
end




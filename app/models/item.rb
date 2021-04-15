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
with_options presense: true do
    validates :name
    validates :explanation
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :area_id
    validates :delivery_day_id
    validates :price
end


end

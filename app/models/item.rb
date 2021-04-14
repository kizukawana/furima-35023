class Item < ApplicationRecord
  belongs_to :user
  has_many :information through: :users
  has_one :item
  has_one_attached :image
  

end

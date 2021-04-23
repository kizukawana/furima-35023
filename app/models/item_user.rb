class ItemUser < ApplicationRecord
  has_one :information
    belongs_to :user
    belongs_to :item
end

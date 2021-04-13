class User < ApplicationRecord
  has_many :items
  has_one_attached :image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }#半角英数字混合
  with_options presence: true do
    validates :nickname#空では登録できない全角
    with_options format:{with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
    validates :first_name_kanji#空では登録できない全角（漢字・ひらがな・カタカナ）
    validates :last_name_kanji#空では登録できない全角（漢字・ひらがな・カタカナ）
    end
    with_options format:{with: /\A[ァ-ヶー－]+\z/ } do
    validates :first_name_kana#空では登録できない全角（カタカナ）
    validates :last_name_kana#空では登録できない全角（カタカナ）
    end
    validates :birthday#空では登録できない
  end
end
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # #ニックネーム
  validates :nickname, presence: true

  # パスワード
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  with_options presence: true do
    # #本人情報確認
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :family_name_katakana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name_katakana, format: { with: /\A[ァ-ヶー－]+\z/ }
    # #生年月日
    validates :birthday, presence: true
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   with_options presence: true do
      ## ユーザー情報
      validates :email, uniqueness: true
      validates :email, inclusion: { in: %w("@") }
      validates :password, format: { with: /[a-z\d]{6,}/i }
      validates :password_confirmation, presence: true
      ##本人情報確認
      validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
      validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
      validates :family_name_katakana, format: { with: /\A[ァ-ヶー－]+\z/ }
      validates :first_name_katakana, format: { with: /\A[ァ-ヶー－]+\z/ }
   end

end

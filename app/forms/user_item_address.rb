class UserItemAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id

  POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/ 
  PHONE_NUMBER_REGEX = /\A\d{11}\z/

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: POSTAL_CODE_REGEX }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :address
    validates :phone_number, format: { with: PHONE_NUMBER_REGEX }
  end

  def save
    user_item_id = UserItem.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, phone_number: phone_number, user_item_id: user_item_id.id)
  end
end

class Address < ApplicationRecord
  belongs_to :user_items

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end

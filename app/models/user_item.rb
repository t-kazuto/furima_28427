class UserItem < ApplicationRecord
  belongs_to :uer
  belongs_to :item
  has one :address
end

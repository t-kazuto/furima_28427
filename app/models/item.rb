class Item < ApplicationRecord
  belongs_to :user
  has_one :user_item
  has_many :users, through: :user_items
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_day

  with_options presence: true do
    validates :name
    validates :explanation
    validates :category_id, numericality: { other_than: 1, message: 'Select' }
    validates :condition_id, numericality: { other_than: 1, message: 'Select' }
    validates :shipping_charge_id, numericality: { other_than: 1, message: 'Select' }
    validates :shipping_area_id, numericality: { other_than: 1, message: 'Select' }
    validates :shipping_day_id, numericality: { other_than: 1, message: 'Select' }
    validates :price, format: { with: /\A[a-zA-Z0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image
  end
end

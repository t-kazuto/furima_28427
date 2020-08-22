class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_day

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :category_id, numericality: { other_than: 1, message: 'Select' }
    validates :condition_id, numericality: { other_than: 1, message: 'Select' }
    validates :shipping_charges_id, numericality: { other_than: 1, message: "Select" }
    validates :shipping_area_id, numericality: { other_than: 1, message: "Select" }
    validates :shipping_days_id, numericality: { other_than: 1, message: "Select" }
    validates :price, format: { with: /\A[a-zA-Z0-9]+\z/, message: "Harf-width number" }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
end
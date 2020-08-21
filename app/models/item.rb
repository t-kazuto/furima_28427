class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_day
  has_one_attached :image

  with_options presence: true do
  validates :image, :name, :explanation, :category_id, :condition_id, :shipping_charges_id, :shipping_area_id, :shipping_days_id, :price
  end

  with_options numericality: { other_than: 1 }  do
  validates :category_id, :condition_id, :shipping_charges_id, :shipping_area_id, :shipping_days_id
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end
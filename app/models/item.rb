class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charges
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_days

  validates :category, numericality: { other_than: 1 } 
end

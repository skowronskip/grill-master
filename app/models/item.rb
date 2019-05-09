class Item < ApplicationRecord
  validates :product, presence: true
  validates :quantity, presence: true
  belongs_to :product
end

class Discount < ApplicationRecord
  enum kind: [:set, :extra]
  validates :name, presence: true
  validates :kind, presence: true
  validates :product_ids, presence: true
end

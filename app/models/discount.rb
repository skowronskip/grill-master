class Discount < ApplicationRecord
  enum kind: [:set, :extra]
end

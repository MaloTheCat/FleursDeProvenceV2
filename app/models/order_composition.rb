class OrderCompositions < ApplicationRecord
  belongs_to :order
  belongs_to :compositions
end

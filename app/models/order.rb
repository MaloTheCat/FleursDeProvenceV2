class Order < ApplicationRecord
  belongs_to :user
  belongs_to :relai
  belongs_to :florist

  has_many :order_compositions
end

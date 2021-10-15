class Order < ApplicationRecord
  belongs_to :user
  belongs_to :relai
  belongs_to :florist

  has_many :order_compositions
  # has_many :compositions
  has_many :compositions, through: :order_compositions
end

class Order < ApplicationRecord
  belongs_to :contact
  belongs_to :relai
  belongs_to :florist

  has_many :order_compositions
  # has_many :compositions
  has_many :compositions, through: :order_compositions

  # accepts_nested_attributes_for


end

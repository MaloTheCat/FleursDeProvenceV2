class Customer < ApplicationRecord
  has_many :orders
  has_many :compositions, :through => :orders

  accepts_nested_attributes_for :orders

end

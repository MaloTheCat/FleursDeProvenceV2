class Customer < ApplicationRecord
  has_many :orders
  has_many :compositions, :through => :orders
end

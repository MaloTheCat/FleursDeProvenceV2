class Composition < ApplicationRecord
  belongs_to :florist
  # has_many :orders
  has_many :orders, :through => :order_compositions

  validates :name, presence: true
  validates :price, presence: true
  validates :size, presence: true


end

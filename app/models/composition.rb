class Composition < ApplicationRecord
  has_one_attached :photo
  belongs_to :florist
  has_many :orders

  # monetize :amount_cents
  monetize :price_cents
  validates :name, presence: true
  # validates :base_price, presence: true
  # validates :size, presence: true

  # accepts_nested_attributes_for :orders

end

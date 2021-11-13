class Composition < ApplicationRecord
  has_one_attached :photo

  belongs_to :florist
  has_many :orders

  validates :name, presence: true
  validates :base_price, presence: true
  # validates :size, presence: true

  accepts_nested_attributes_for :orders

  def setPrice(size)
    case size
    when "S"
      price = base_price
    when "M"
      price = base_price + 10
    when "L"
      price = base_price + 20
    else
      price = base_price
    end
  end

end

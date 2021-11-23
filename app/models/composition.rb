class Composition < ApplicationRecord
  has_one_attached :photo

  belongs_to :florist
  has_many :orders

  # monetize :price_cents
  monetize :amount_cents

  validates :name, presence: true
  # validates :base_price, presence: true
  # validates :size, presence: true

  # accepts_nested_attributes_for :orders

  # Stripe::SKU.list({@order.composition(attributes[size]=S)})

  def setPrice(size)
    case size
    when "M"
      price.to_i + 10
    when "L"
      price.to_i + 20
    else
      price.to_i
    end
  end

end

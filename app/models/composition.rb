class Composition < ApplicationRecord
  has_one_attached :photo

  belongs_to :florist
  has_many :orders

  validates :name, presence: true
  validates :base_price, presence: true
  # validates :size, presence: true

  accepts_nested_attributes_for :orders

  # def setPrice
  #   size = ["S", "M", "L"]
  #   if size == "M"
  #     @composition.price = @composition.price + 10
  #   elsif size == "L"
  #     @composition.price = @composition.price + 20
  #   else
  #     price
  #   end
  # end

  def size
    size = ["S", "M", "L"]
    if size == "M"
      @composition.base_price = @composition.base_price + 10
      return size
    elsif size == "L"
      @composition.base_price = @composition.base_price + 20
      return size
    else
      return size
    end

    # S
    # M
    # L
  end

end

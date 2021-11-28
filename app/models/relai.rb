class Relai < ApplicationRecord
  has_many :orders

  validates :name, presence: true
  validates :address, presence: true

  accepts_nested_attributes_for :orders

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end

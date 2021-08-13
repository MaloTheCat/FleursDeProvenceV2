class Florist < ApplicationRecord
  has_many :orders
  has_many :flowers

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

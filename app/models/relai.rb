class Relai < ApplicationRecord
  has_many :orders

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

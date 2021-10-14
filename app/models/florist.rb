class Florist < ApplicationRecord
require 'json'
require 'open-uri'

  has_many :orders
  has_many :compositions
  has_many :relais

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end

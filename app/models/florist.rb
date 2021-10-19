class Florist < ApplicationRecord
require 'json'
require 'open-uri'

  has_many :orders, :through => :compositions
  has_many :compositions
  # has_many :relais

  validates :name, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end

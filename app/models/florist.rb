class Florist < ApplicationRecord
require 'json'
require 'open-uri'

  has_many :orders
  has_many :compositions

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def feed_fb
    feed = open("https://graph.facebook.com/v11.0/me?fields=posts&access_token=EAAHcYljV55QBABjZAZCT3JlyCiJBS51uS4QhhVZADgii6945WTBp8YcZCP9NYa5W7R2ZC1q7lXDsWN5qk4DDpwZCEQWdzYn3ZCxzPIaMF5t6YGewV8I6ogHXIWcx8DTmINxjbXIQdPhmxZCXdGkrg4qgJ7ZClqZBnPQZANXQnhFTbEJKZC2ePQcF5v5zZB6Mfps0aFWJ3Rj5yT8ivkSnh5aMzEdRA")
    json = JSON.parse(feed.read)
    feedObjects = json["posts"]["data"]
  end

end

class Florist < ApplicationRecord
require 'json'
require 'open-uri'

  has_many :orders
  has_many :compositions

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def feed_fb
    feed = open("https://graph.facebook.com/v11.0/me?fields=posts&access_token=EAAHcYljV55QBAFjR2EEBu5uYZAMxLxWv92NaLbUgGtZA1Sga0RfMEIqYXCaGU3HrWRnpmmdEONl1260kCdnpdnoAnKBHqywUKwf15q7UQJ2Tb7KeFuDfaqUMHQerAV9CxeU7pTvMqe82400Tfx6sYU8rKZCRTLxZB76H5FpH5GtrYFojBBC5tE0CYdwDpwzNm4XtRw1okQZDZD")
    json = JSON.parse(feed.read)
    feedObjects = json["posts"]["data"]
  end

end

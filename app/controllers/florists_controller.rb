class FloristsController < ApplicationController
  require 'stripe'

  def home
    @florists = Florist.all
    @florist = Florist.first
    @compositions = Stripe::Price.list({limit:21, expand: ['data.product']})
    @relais = Relai.all

    # the `geocoded` scope filters only relais with coordinates (latitude & longitude)
    @markers = @relais.geocoded.map do |f| {
        lat: f.latitude,
        lng: f.longitude,
        image_url: helpers.asset_url('marker.png')
      }
    end

  end
end

class FloristsController < ApplicationController
  require 'stripe'

  def home
    @florists = Florist.all
    @florist = Florist.first
    @compositions = Stripe::Price.list({limit:15, expand: ['data.product']})
    @relais = Relai.all

    # @toto = Stripe::Price.retrieve('price_1JxC8kFE4oPSz5YOc391IZ9I').nickname

    # the `geocoded` scope filters only relais with coordinates (latitude & longitude)
    @markers = @relais.geocoded.map do |f| {
        lat: f.latitude,
        lng: f.longitude,
        image_url: helpers.asset_url('marker.png')
      }
    end

  end
end

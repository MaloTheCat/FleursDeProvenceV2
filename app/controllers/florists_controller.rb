class FloristsController < ApplicationController
  def home
    @florists = Florist.all
    @florist = Florist.first
    @compositions = Stripe::Price.list({limit:15, expand: ['data.product']})
    @relais = Relai.all

    # the `geocoded` scope filters only florists with coordinates (latitude & longitude)
    @markers = @florists.geocoded.map do |f| {
        lat: f.latitude,
        lng: f.longitude
      }
    end
  end
end

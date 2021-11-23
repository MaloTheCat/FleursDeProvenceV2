class FloristsController < ApplicationController
  def home
    @florists = Florist.all
    @florist = Florist.first
    @compositions = @florist.compositions     # Récupérer toutes les compositions du @florist
    @relais = Relai.all
    # the `geocoded` scope filters only florists with coordinates (latitude & longitude)
    @markers = @florists.geocoded.map do |f| {
        lat: f.latitude,
        lng: f.longitude
      }
    end
  end
end

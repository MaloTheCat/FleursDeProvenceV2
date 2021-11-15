class FloristsController < ApplicationController

  before_action :find_florist, only: [:composition, :evenement, :contact, :cgv]

  def home
    # @florist = Florist.find(params[:id])
    @florists = Florist.all
    @florist = Florist.first
    @compositions = @florist.compositions     # Récupérer toutes les compositions du fleuriste
    @relais = Relai.all

    # the `geocoded` scope filters only florists with coordinates (latitude & longitude)
    @markers = @florists.geocoded.map do |f| {
        lat: f.latitude,
        lng: f.longitude
      }
    end
  end

private
  # def find_florist
  #   @florist = Florist.first
  # end

  # def florist_params
  #   params.require(:florist).permit(:name, :address, :latitude, :longitude)
  # end

end

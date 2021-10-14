class FloristsController < ApplicationController

  before_action :find_florist, only: [:composition, :evenement, :contact, :cgv]

  def home
    # @florist = Florist.find(params[:id])
    @florists = Florist.all
    @florist = Florist.find(id=1)
    @compositions = @florist.compositions
    @relais = Relai.all

    # the `geocoded` scope filters only florists with coordinates (latitude & longitude)
    @markers = @florists.geocoded.map do |f| {
        lat: f.latitude,
        lng: f.longitude
      }
    end
  end

  # def composition
  # end

  # def evenement
  # end

  # def contact
  #   @contact = Contact.new
  # end

  # def cgv
  # end

private
  # def find_florist
  #   # @florist = Florist.find(id=4)
  #   @florist = Florist.find(params[:id])
  # end

  # def florist_params
  #   params.require(:florist).permit(:name, :address, :latitude, :longitude)
  # end

end

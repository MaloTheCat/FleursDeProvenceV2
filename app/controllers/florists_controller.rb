class FloristsController < ApplicationController

def home
  @florists = Florist.all
  @florist = Florist.find(params[:id])

    # the `geocoded` scope filters only florists with coordinates (latitude & longitude)
    @markers = @florists.geocoded.map do |f|
      {
        lat: f.latitude,
        lng: f.longitude
      }
    end
end

private

  def florist_params
    params.require(:florist).permit(:name, :address, :latitude, :longitude)
  end

end

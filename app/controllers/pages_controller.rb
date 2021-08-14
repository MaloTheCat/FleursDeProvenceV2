class PagesController < ApplicationController

  def composition
    # @florist = Florist.find(params[:id])
  end

private

  def florist_params
    # params.require(:florist).permit(:name, :address, :latitude, :longitude)
  end
end

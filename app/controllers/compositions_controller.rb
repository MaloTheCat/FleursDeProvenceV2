class CompositionsController < ApplicationController
  # before_action :find_florist, only: [:index, :show]

  def index
    # @compositions = @florist.compositions
    @compositions = Stripe::Price.list({limit:15, expand: ['data.product']})
  end

  def show
    @composition = Stripe::Price.retrieve({id: params[:id], expand: ['product']})
    @compositionsProduct = Stripe::Price.list(product: @composition.product)

    @relais = Relai.all

    @markers = @relais.geocoded.map do |f| {
        lat: f.latitude,
        lng: f.longitude
      }
    end
  end

  private

  # def find_florist
  #   @florist = Florist.first
  # end

  def composition_params
    params.require(:composition).permit(:id, :name, :price, :quantity, :disponibility, :photo_title)
  end

end

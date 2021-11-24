class CompositionsController < ApplicationController
  before_action :find_florist, only: [:index, :show]

  def index  # voir toutes les compositions
    @compositions = @florist.compositions
  end

  def show # voir une composition
    @composition = Stripe::Price.retrieve(params[:id])
    @relais = Relai.all
  end

  private

  def find_florist
    @florist = Florist.first
  end

  def composition_params
    params.require(:composition).permit(:id, :name, :price, :quantity, :disponibility, :photo_title)
  end

end

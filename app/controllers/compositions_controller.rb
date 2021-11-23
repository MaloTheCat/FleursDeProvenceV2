class CompositionsController < ApplicationController
  before_action :find_florist, only: [:index, :show]

  def index  # voir toutes les compositions
    @compositions = @florist.compositions
  end

  def show # voir une composition
    # @composition = Composition.find(params[:id])
    # @composition = Stripe::Product.retrieve(params[:composition_id]) # Récupérer la composition
    @composition = Stripe::Product.retrieve(params[:id]) # Récupérer la composition
    @compositionPrices = Stripe::Price.list(product: @composition)

    @relais = Relai.all

  end

  # def new
  #   @composition = Composition.new
  # end

  # def create
  #   @composition = Composition.new
  #   if @composition.save
  #     redirect_to root_path
  #   else
  #     render:new
  #   end
  # end

  private

  def find_florist
    @florist = Florist.first
  end

  def composition_params
    params.require(:composition).permit(:id, :name, :price, :quantity, :disponibility, :photo_title)
  end

end

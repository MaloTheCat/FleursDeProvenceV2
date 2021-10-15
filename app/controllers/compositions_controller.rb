class CompositionsController < ApplicationController

  before_action :find_florist, only: [:index, :show]

  def index  # voir toutes les compositions
    @compositions = @florist.compositions
    # @composition = Composition.find(params[:id])
  end

  def show # voir une composition
    @composition = Composition.find(params[:id])
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
    @florist = Florist.find(id=1)
  end

  def composition_params
    params.require(:composition).permit(:id, :name, :price, :quantity, :disponibility, :photo_title)
  end

end

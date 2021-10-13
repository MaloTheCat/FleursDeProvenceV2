class CompositionsController < ApplicationController

# before_action :find_florist only: [:index, :show]

  def index  # voir toutes les compositions
    @florist = Florist.find(id=1)
    @compositions = @florist.compositions
  end

  def show # voir une composition
    @florist = Florist.find(id=1)
    @composition = Composition.find(params[:id])
    # @composition.get_price_by_size
  end

  def new
    @composition = Composition.new
  end

  def create
    @composition = Composition.new
    if @composition.save
      redirect_to root_path
    else
      render:new
    end
  end

  private

  # def find_florist
  #   @florist = Florist.find(id=1)
  # end

  def composition_params
    params.require(:composition).permit(:name, :price, :quantity, :disponibility, :photo_title)
  end

end

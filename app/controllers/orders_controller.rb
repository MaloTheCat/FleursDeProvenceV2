class OrdersController < ApplicationController

  # before_action :find_florist, only: [:index, :show, :new]
  # before_action :composition_params, only: [:new]

  def index
    @orders = Order.all
    @order = Order.find(params[:id])
    # @relais = Relai.all
  end

  def show
    # @composition = Composition.find(params[:id])
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @composition = Composition.find(params[:composition_id])
    @relais = Relai.all
    @relai = Relai.find(params[:composition_id])
    # @order = @composition.order
  end

  def create
    if @order.save
      redirect_to composition_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:id, :total_price, :state_order)
  end

  # def find_florist
  #   @florist = Florist.find(id=1)
  # end

  # def composition_params
  #   params.require(:composition).permit(:name, :price, :quantity, :disponibility, :photo_title)
  # end

  # def show(id)
  #   @order = Order.find(params(:id))
  # end

end

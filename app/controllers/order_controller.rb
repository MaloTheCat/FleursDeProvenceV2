class OrderController < ApplicationController

  before_action :find_florist, only: [:index, :show]

  def index
    @orders = Order.all
    # @relais = Relai.all
  end

  def show
    @composition = Composition.find(params[:id])
    @order = Order.find(params:id)
  end

  def new
    @order = order.new
  end

  def create
    if @order.save
      redirect_to composition_path
    else
      render :new
    end
  end

  private

  def find_florist
    @florist = Florist.find(id=1)
  end

  # def show(id)
  #   @order = Order.find(params(:id))
  # end
  end
end

class OrderController < ApplicationController

  def index
    @orders = Order.all
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

  # def show(id)
  #   @order = Order.find(params(:id))
  # end
end

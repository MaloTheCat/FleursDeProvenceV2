class OrderController < ApplicationController

  def index
    @orders = Order.all
  end

  # def show(id)
  #   @order = Order.find(params(:id))
  # end
end

class OrdersController < ApplicationController

  # before_action :find_florist, only: [:index, :show, :new]
  # before_action :composition_params, only: [:new]

  def index
    # @orders = Order.all                                       # Inutile
    # @order = Order.find(params[:id])                          # Inutile
  end

  def show
    # @order = Order.find(params[:id])                          # Inutile
  end

  # def new
  #   @composition = Composition.find(params[:composition_id])
  #   @order = Order.new(params[composition_id: @composition])
  #   @relais = Relai.all
  #   @compositions = Composition.all
  #   # @order_relai = @relai
  #   # @order_composition = @composition
  #   # @composition = @composition.size
  # end

    # @customer = Customer.new                                    # Créer une instance de customer

  def new
    @composition = Composition.find(params[:composition_id])    # Afficher la composition selectionnée
    @compositions = Composition.all                             # Afficher la liste des compositions
    @relais = Relai.all                                         # Afficher la collection de relais

    @order = Order.new
  end

  def create
    @composition = Composition.find(params[:composition_id])    # Afficher la composition selectionnée
    @size = Size.find_by(name: "#{params[:radio]}")
    @order = Order.new(order_params)
    @order.composition_id = @composition.id
    @order.size_id = @size.id

    # @order = Order.new(order_params)
    if @order.save!
      # raise
      OrderMailer.order_mail(@order).deliver
      # raise
      redirect_to thanks_purchase_path
    else
      redirect_to compositions_path
    end
  end

  def thanksPurchase
  end

  private

  def order_params
    params.require(:order).permit(:relai_id, :composition_id)
  end

end

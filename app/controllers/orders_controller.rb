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

  def new
    @composition = Composition.find(params[:composition_id])
    @order = Order.new(composition_id: @composition)
    @relais = Relai.all
    @compositions = Composition.all
    # @composition = @composition.size
  end

  # def new
  #   @order = Order.new                                          # Créer une instance d'order
  #   @composition = Composition.find(params[:composition_id])    # Récupérer l'ID de composition selectionné
  #   @compositions = Composition.all                             # Afficher la liste des compositions
  #   @relais = Relai.all                                         # Afficher la collection de relais
  #   # @customer = Customer.new                                    # Créer une instance de customer
  # end

  def create
    @order = Order.new(order_params)
    if @order.save!
      # raise
      OrderMailer.order_mail(@order).deliver
      # raise
      redirect_to thanks_purchase_path
    else
      redirect_to compositions_path
    end
  end

  # def update
  #   @order = Order.find(:id)
  #   @order.update(order_params)
  # end

  def thanksPurchase
  end

  private

  def order_params
    params.require(:order).permit(:relai_id, :composition_id)
  end

end

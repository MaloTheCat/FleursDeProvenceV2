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

  def test
    @compositions = Composition.all
    @relais = Relai.all                                         # Avoir @relais dans le form
  end

  def new
    @order = Order.new                                          # Créer une instance d'order
    @composition = Composition.find(params[:composition_id])    # Récupérer l'ID de composition selectionné
    @compositions = Composition.all                             # Afficher la liste des compositions
    @relais = Relai.all                                         # Afficher la collection de relais
    # @customer = Customer.new                                    # Créer une instance de customer
  end

  def create
    @order = Order.new(order_params)
    if @order.save!
      OrderMailer.order_mail(@order).deliver
      redirect_to thanks_purchase_path
    else
      redirect_to compositions_path
    end
  end

  def thanksPurchase
  end

  private

  def order_params
    params.require(:order).permit(:relai_id, :composition_id, :customer_id)
  end

end

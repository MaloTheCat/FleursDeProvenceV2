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
  end

  def create
    @order = Order.new(order_params)
    if @order.save!
      # raise
      OrderMailer.order_mail(@order).deliver
      redirect_to thanks_purchase_path
    else
      raise
      render compositions_path
    end
  end

  def thanks
  end

  private

  def order_params
    params.require(:order).permit(:relai_id, :composition_id)

    # params.require(:order).permit(
    #   florist_attributes: [:id],
    #   relai_attributes: [:id, :name, :address],
    #   composition_attributes: [:id, :name]
    #   )
  end

end

    # @composition = @order.composition
    # @relai = Relai.find(params[:relai_id])
    # @relai = @order.relai_id
    # @relai = Relai.find_by(:id)
    # @relai = Relai.find(:id)
    # @order = @order.relais
    # @relai = Relai.find(params[:relai_id])
    # @order = @composition.order
    # @orders = @contact.orders

      # @relai = Relai.find_by('id') # Should be :relai_id. Return 'Couldn't find Relai without an ID'
      # @relai = Relai.find(order_compo_params)
      # @relai = Relai.find(params[:order][:relai])
      # @contact = Contact.new(contact_params)
      # @contact.order = @order
      # @relai = Relai.find_by(:id) # Should be :relai_id. Return 'Couldn't find Relai without an ID'


    # { order: params.require(:order).permit(:id, :total_price, :state_order),
    #   composition: params.require(:composition).permit(:id, :name, :price, :size),
    #   # relai: params.require(:relai).permit(:id, :name, :address)
    # }
    # params.permit(order:[ :total_price, :state_order, :relai_id, :composition_id, :customer_id], composition:[ :name, :price, :size], florist:[ :id])
    # params.require(:order).permit(:total_price, :state_order, florist_attributes: [:id], relai_attributes: [:id, :name], composition_attributes:[ :name, :price, :size])
    # :total_price, :state_order,
    #   florist_attributes: [],
    #   relai_attributes: [],
    #   composition_attributes: [])

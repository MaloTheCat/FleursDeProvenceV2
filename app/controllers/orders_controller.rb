class OrdersController < ApplicationController

  # before_action :find_florist, only: [:index, :show, :new]
  # before_action :composition_params, only: [:new]

  def index
    @orders = Order.all
    @order = Order.find(params[:id])
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @composition = Composition.find(params[:composition_id])
    @relais = Relai.all
    # @relai = Relai.find(params[:relai_id])
    # @order = @composition.order
    # @orders = @contact.orders
    # raise
  end

  def create
    @florist = Florist.first
    @composition = Composition.find(params[:composition_id])
    # @relai = Relai.find_by('id') # Should be :relai_id. Return 'Couldn't find Relai without an ID'
    # @relai = Relai.find(order_compo_params)
    @relai = Relai.find(params[:order][:relai])

    @order = Order.new(order_compo_params)

    # @contact = Contact.new(contact_params)
    # @contact.order = @order

    if @order.save!
      raise
      OrderMailer.order_mail(@order).deliver
      redirect_to thanks_purchase_path
    else
      render :new
    end
  end

  def thanks
  end

  private

  def order_compo_params
    # { order: params.require(:order).permit(:id, :total_price, :state_order),
    #   composition: params.require(:composition).permit(:id, :name, :price, :size),
    #   # relai: params.require(:relai).permit(:id, :name, :address)
    # }
    # params.permit(order:[ :total_price, :state_order, :relai_id, :composition_id, :customer_id], composition:[ :name, :price, :size], florist:[ :id])
    # params.require(:order).permit(:total_price, :state_order, florist_attributes: [:id], relai_attributes: [:id, :name], composition_attributes:[ :name, :price, :size])
    params.require(:order).permit(
      :total_price, :state_order,
      florist_attributes: [:id],
      composition_attributes:[:name, :price, :size],
      relai_attributes: [:id, :name, :address])
    # :total_price, :state_order,
    #   florist_attributes: [],
    #   relai_attributes: [],
    #   composition_attributes: [])
  end

end

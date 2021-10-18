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
    @florist = Florist.find(id=1)

    @composition = Composition.find(params[:composition_id])

    @relais = Relai.all
    # @relai = Relai.find(params[:relai_id]) # Why put :composition_id? Should be :relai_id. Return 'Couldn't find Relai without an ID'

    @order = Order.new(params[order_compo_params])

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
    params.permit(order:[ :total_price, :state_order], composition:[ :name, :price, :size])
  end

  # def relai_params
  #   params.require(:relai).permit(:id, :name, :address)
  # end

  # def contact_params
  #   params.require(:contact).permit(:order_id)
  # end

  # def find_florist
  #   @florist = Florist.find(id=1)
  # end

  # def composition_params
  #   params.require(:composition).permit(:name, :price, :quantity, :disponibility, :photo_title)
  # end

end

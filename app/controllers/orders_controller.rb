class OrdersController < ApplicationController

  # before_action :find_florist, only: [:index, :show, :new]
  # before_action :composition_params, only: [:new]

  def show
    @order = Order.find(params[:id])
  end

  def create
    @composition = Stripe::Price.retrieve(params[:composition_id])
    @relais = Relai.all
    @relai = Relai.find(params[:relai_id])
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        name: Stripe::Product.retrieve(@composition.product).name,
        images: [Stripe::Product.retrieve(@composition.product).images.first],
        # nickname: Stripe::Price.list({limit:15, expand: ['data.product']}).map do |price| price.nickname end
        # nickname: @composition.nickname,
        amount: @composition.unit_amount,
        currency: 'eur',
        quantity: '1'
      }],
      phone_number_collection: {
        enabled: true
      },
      success_url: thanks_purchase_url,
      cancel_url: fails_purchase_url
    })
    # respond_to :json

    # @url = @session.url
    # fetch(@url).then(response => response.json())

    # respond_to do |format|
      # format.html
      # format.json { render json: @session.url }
      # format.xml { render xml: @session }
    # end

    # render json: @session.url
    # render html: @session.url

    redirect_to(@session.url)
  end

  def thanksPurchase
  end

  # def checkout
  # end

  private

  # def order_params
  #   params.require(:order).permit(
  #     :relai_id,
  #     :composition_id
  #   )
  # end

end

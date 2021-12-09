class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def create
    @composition = Stripe::Price.retrieve(params[:composition_id])
    @composition_name = Stripe::Product.retrieve(@composition.product).name
    @composition_image = Stripe::Product.retrieve(@composition.product).images.first

    @relais = Relai.all
    @relai = Relai.find(params[:relai_id])
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        price: @composition.id,
        quantity: '1'
      }],
      metadata: {relai: @relai.name},
      phone_number_collection: {
        enabled: true
      },
      mode: 'payment',
      success_url: thanks_purchase_url,
      cancel_url: fails_purchase_url
    })
    redirect_to(@session.url)
  end

  def thanksPurchase
  end

  private

  # def order_params
  #   params.require(:order).permit(
  #     :relai_id,
  #     :composition_id
  #   )
  # end

end

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

class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    event = nil

    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, Rails.application.credentials[:production][:stripe][:webhook]
      )
    rescue JSON::ParserError => e
      status 400
      return
    rescue Stripe::SignatureVerificationError => e
      # Invalid signature
      puts "Signature error"
      p e
      return
    end

    # Handle the event
    case event.type
    when 'checkout.session.completed'
      session = event.data.object
      @order = Stripe::Checkout::Session.retrieve({
        id: session.id,
        expand: ["line_items", "customer"]
      })



      # @order.line_items.data.each { |item|
      #   @item_description = item.description, # => Soleil Levant
      #   @item_amount = item.price.unit_amount # => 4000
      # end

      # # @composition = Stripe::Price.retrieve({id: params[:id], expand: ['product']})
      # @compositionsProduct = Stripe::Price.list(product: @composition.product, expand: ['data.product'])
      # @compositionsProduct.each { |composition|
      #   composition.id # => Price ID: price_1JxC8kFE4oPSz5YOc391IZ9I
      #   composition.product.id # => Product ID: prod_KcR0HgpfzldOj8
      #   composition.nickname # => S
      #   composition.product.name # => Nom: Soleil Levant
      # }

      # @order.nickname = Stripe::Price.retrieve({name: @item_description && price: @item_amount })







      # Stripe::Price.list()

      # @customer = @order.customer.id
      # @invoice = Stripe::Invoice.create({ customer: @order.customer.id })

      # @order = Stripe::Checkout::Session.retrieve({})
      # @order.line_items.data.each do |line|
        # @price = Stripe::Price.list(`#{line.price.id}`)
        # @toto = Stripe::Price.retrieve(`#{line.price.id}`).nickname
      # end
      # @order = @order.price

      # line_items[0].price: 'price_1JxC8kFE4oPSz5YOc391IZ9I' # price choose
      # @size = Stripe::Checkout.retrieve()

      # @line_item = Stripe::Checkout::Session.list_line_items('#{@order.id}', {limit: 5})
      # @order.line_items.data.each do |line|
      #   @nickname = line.nickname
      # end

      OrderMailer.order_mail(@order).deliver
    end
    render json: { message: 'success' }
  end

  private
  # def params_webhook
  #   params.require(:order).permit(
  #     :relai_id,
  #     :composition_id
  #   )
  # end
end

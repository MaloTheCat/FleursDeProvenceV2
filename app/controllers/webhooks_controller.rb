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
      OrderMailer.order_mail(@order).deliver
      # CustomerMailer.customer_mail(@order.customer.email).deliver
      CustomerMailer.customer_mail(@order).deliver
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

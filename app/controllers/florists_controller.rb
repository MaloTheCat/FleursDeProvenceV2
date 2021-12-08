class FloristsController < ApplicationController
  require 'stripe'

  def home
    @florists = Florist.all
    @florist = Florist.first
    @compositions = Stripe::Price.list({limit:15, expand: ['data.product']})
    @relais = Relai.all
    # @composition = Stripe::Price.retrieve('price_1JxC8kFE4oPSz5YOc391IZ9I')

    # @line_item = Stripe::Checkout::Session.list_line_items('cs_test_a1E208XLIVgaAlAUpzjqmEu4rsNJ6pnvNx9PnbllkbkEfPrFB6SvJ3lj1O', {limit: 5})
    # @line_items = Stripe::Checkout::Session.list_line_items('cs_test_a1tslb325FxOS0A94HDfANoPXGxySN6KWyISQTQ70DpBXgEWY5IfzrYzZP', {limit: 5})

    # @a = Stripe::Price.retrieve('price_1JzP8dFE4oPSz5YORypGocUY').nickname

    # the `geocoded` scope filters only relais with coordinates (latitude & longitude)
    @markers = @relais.geocoded.map do |f| {
        lat: f.latitude,
        lng: f.longitude,
        image_url: helpers.asset_url('marker.png')
      }
    end

  end
end

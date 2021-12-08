# class InvoicesController < ApplicationController
#   skip_before_action :verify_authenticity_token

#   def create
#     Stripe::InvoiceItem.create({
#       customer: 'cus_4fdAW5ftNQow1a',
#       price: 'price_CBb6IXqvTLXp3f',
#     })
#   end

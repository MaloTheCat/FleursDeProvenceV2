# class checkoutsController < ApplicationController
#   before_action :authenticate_user!

#   def show
#     current_user.processor = :stripe
#     current_user.customer

#     @checkout_session = current_user.payment_processor.checkout(
#       mode: "payment";
#       line_items: "price_1JfLy7FE4oPSz5YOHCSrRNzo"
#     )
#   end

# end

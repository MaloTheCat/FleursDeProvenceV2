class CustomersController < ApplicationController

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.save
  end

  private

  def customer_params
    params.require(:customer).permit(:firstname, :lastname)

    # params.permit(
      # customer: [:firstname, :lastname])
      # florist:[ :florist_id,]
      # order:[ :total_price, :state_order],
      # relai:[ :name, :address],
      # composition: [ :name, :size, :price])
  end
end

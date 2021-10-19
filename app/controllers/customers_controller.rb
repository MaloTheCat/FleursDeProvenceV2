class CustomersController < ApplicationController

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.create(customer_params)
  end

  private

  def customer_params
    params.permit(order:[ :total_price, :state_order], relai:[ :name, :address], composition: [ :name, :size, :price])
  end
end

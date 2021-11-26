class CompositionsController < ApplicationController
  before_action :find_florist, only: [:index, :show]

  def index
    # @compositions = @florist.compositions
  end

  def show
    # @composition = Stripe::Price.retrieve(params[:id])
    @composition = Stripe::Price.retrieve({id: params[:id], expand: ['product']})
    @compositionsProduct = Stripe::Price.list(product: @composition.product)
    # @compositionsProduct.sort_by { |hash| hash[:nickname] }
    # @compositionPrice = Stripe::Price.list(product: @composition.product)
    # @compositionPrices.map do |price|
    #   price
    # end

    # @arrayLine = []
    # Stripe::Price.list(product: @composition.product).map do |line|
    #   @arrayLine << line.nickname
    # end
    # @sortedLetters = @arrayLine.sort.reverse

    # @sizeS = Stripe::Price.retrieve(.nickname)

    # @composition = Stripe::Price.retrieve({ id: 'price_1JfLy7FE4oPSz5YO1G5Q0yWD', expand: ['product']})
    # @composition.product.id
    # @composition.product.


    # @compositionsProduct.map do |line|
    #   line.order(nickname: :desc)
    # end

    # SELECT compositions FROM composition ORDER BY [:nickname]


    @relais = Relai.all


  end

  private

  def find_florist
    @florist = Florist.first
  end

  def composition_params
    params.require(:composition).permit(:id, :name, :price, :quantity, :disponibility, :photo_title)
  end

end

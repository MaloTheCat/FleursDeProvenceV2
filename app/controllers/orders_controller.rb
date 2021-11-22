class OrdersController < ApplicationController

  # before_action :find_florist, only: [:index, :show, :new]
  # before_action :composition_params, only: [:new]

  def show
    @order = Order.find(params[:id])
  end

  # def new                                                       # sur ta page Orders/new.html.erb
  #   @composition = Composition.find(params[:composition_id])    # Afficher la composition selectionnée
  #   @compositions = Composition.all                             # Afficher la liste des compositions
  #   @relais = Relai.all                                         # Afficher la collection de relais
  #   @order = Order.new
  # end

  def create
    # case size
    # when "M"
    #   @composition = Composition.find(params[:composition_id])
    # when "L"

    # end


    # @composition = Composition.find(params[:composition_id])    # Afficher la composition selectionnée
    # @composition = Stripe::Product.find(params[:product])    # Afficher la composition selectionnée
    # @new_composition = Stripe::SKU.list({@order.composition(attributes[size]=S)})
    @relais = Relai.all                                         # Afficher la collection de relais
    @size = Size.find_by(name: "#{params[:radio]}")             # Envoyer les sizes en params pour les avoir dans le mail
    @relai = Relai.find(params[:relai_id])                      # Récupère le relais choisi
    @order = Order.create!(                                     # Créer un Order avec :
      composition: @composition,                                #  - la composition
      amount: @composition.price.to_i,                          #  - son prix
      state: 'pending',                                         #  - le statut
      relai: @relai,                                            #  - le relai
      size: @size                                               #  - la taille
    )


    # ----- GET SIZE -----
    # Stripe::Price.retrieve('price_1JxC8kFE4oPSz5YOc391IZ9I').nickname  ==> Renvoie "S"

    # ----- GET PRICE -----
    # Stripe::Nickname.retrieve('').unit_amount


          # -------------- PRICE --------------

    # Stripe::Price.list().map do |price|
    #   price[:id]                              # Renvoie l'ID de Stripe
    #   price[:unit_amount]                     # Renvoie le prix
    #   price[:nickname]                        # Renvoie la taille
    # end

    #       # -------------- PRODUCT --------------
    # Stripe::Product.list().map do |composition|           # Pour toutes les compositions :
    #   composition[:id]                          # Renvoie l'ID
    #   composition[:name]                        # Renvoie le nom
    # end


    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @composition.name,
        images: [@composition.photo_title],
        amount: @composition.price_cents,
        currency: 'eur',
        quantity: '1'
      }],
      success_url: order_url(@order),
      cancel_url: order_url(@order)
    )

    @order.update(checkout_session_id: @session.id)
    redirect_to new_order_payment_path(@order)

    # if @order.save!
    #   OrderMailer.order_mail(@order).deliver
    #   redirect_to thanks_purchase_path
    # else
    #   redirect_to compositions_path
    # end
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

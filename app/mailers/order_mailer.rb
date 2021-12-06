class OrderMailer < ApplicationMailer
  def order_mail(order)
    @order = order
    mail to: ENV["IONOS_USERNAME_KEY"], subject: "Nouvelle commande" if @order.any?
  end
end

# Celui qui reçoit le mail de la commande

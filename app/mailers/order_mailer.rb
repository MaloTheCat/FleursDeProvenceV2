class OrderMailer < ApplicationMailer
  def order_mail(order)
    @order = order
    mail to:"contact@fleursdeprovence.fr", subject: "Contact du site web Fleurs de Provence"
  end
end

# Celui qui reçoit le mail de la commande

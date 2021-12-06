class OrderMailer < ApplicationMailer
  def order_mail(order)
    @order = order
    mail to: "contact@fleursdeprovence.fr", subject: "Nouvelle commande"
  end
end

# Celui qui reçoit le mail de la commande

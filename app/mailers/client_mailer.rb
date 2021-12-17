class ClientMailer < ApplicationMailer
  def client_mail(contact)
    @order.customer.email = contact
    mail to: @order.customer.email, subject: "Résumé de votre commande Fleurs de Provence"
  end
end

# Le client qui reçoit le mail de sa commande

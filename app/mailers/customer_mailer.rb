class CustomerMailer < ApplicationMailer
  def customer_mail(contact, order)
    @order = order
    @customer = contact
    mail to: @customer, subject: "Votre commande Fleurs de Provence"
  end
end

# Le client qui reçoit le mail de sa commande

class CustomerMailer < ApplicationMailer
  def customer_mail(contact)
    @customer = contact
    mail to: @customer, subject: "Résumé de votre commande Fleurs de Provence"
  end
end

# Le client qui reçoit le mail de sa commande

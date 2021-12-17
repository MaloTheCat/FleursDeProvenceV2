class ClientMailer < ApplicationMailer
  def client_mail(contact)
    @contact = contact
    mail to: @contact, subject: "Résumé de votre commande Fleurs de Provence"
  end
end

# Le client qui reçoit le mail de sa commande

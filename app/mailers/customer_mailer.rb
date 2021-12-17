class CustomerMailer < ApplicationMailer
  def customer_mail(contact)
    @customer = contact
    @order = params[:order]
    mail to: @customer, subject: "Votre commande Fleurs de Provence"
  end
end

# Le client qui reçoit le mail de sa commande

class CustomerMailer < ApplicationMailer
  def customer_mail(contact)
    @customer = contact
    @order = Stripe::Checkout::Session.retrieve({
        id: session.id,
        expand: ["line_items", "customer"]
      })
    mail to: @customer, subject: "Votre commande Fleurs de Provence"
  end
end

# Le client qui reçoit le mail de sa commande

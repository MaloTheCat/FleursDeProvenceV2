class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to:"contact@fleursdeprovence.fr", subject: "Contact du site web Fleurs de Provence"
  end
end

# Celui qui reçoit le mail du contact

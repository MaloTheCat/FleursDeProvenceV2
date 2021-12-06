class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to:ENV["IONOS_USERNAME_KEY"], subject: "Contact du site web Fleurs de Provence"
  end
end

# Celui qui reçoit le mail du contact

class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to:"jonathan.vanderbosse@gmail.com", subject: "Contact du site web Fleurs de Provence"
  end
end

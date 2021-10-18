class ApplicationMailer < ActionMailer::Base
  default from: 'contact@fleursdeprovence.fr'
  layout 'mailer'
end

# Celui qui envoie le mail

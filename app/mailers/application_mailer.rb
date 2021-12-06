class ApplicationMailer < ActionMailer::Base
  default from: ENV["IONOS_USERNAME_KEY"]
  layout 'mailer'
end

# Celui qui envoie le mail

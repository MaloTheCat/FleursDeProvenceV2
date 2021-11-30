Rails.configuration.stripe = {
  publishable_key: Rails.application.credentials.stripe[:stripe_publishable_key],
  secret_key: Rails.application.credentials.stripe[:stripe_secret_key]
  # signing_secret:  ENV['STRIPE_WEBHOOK_SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
# Stripe.api_key = ENV['STRIPE_SECRET_KEY']
# StripeEvent.signing_secret = Rails.configuration.stripe[:signing_secret]

# if Rails.application.credentials[:stripe].present? && Rails.application.credentials[:stripe][:secret_key].present?
#   Stripe.api_key = Rails.application.credentials[:stripe][:secret_key]
# end

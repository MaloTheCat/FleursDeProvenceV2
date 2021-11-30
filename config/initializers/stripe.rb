Rails.configuration.stripe = {
  publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
  secret_key: ENV['STRIPE_SECRET_KEY']
  # signing_secret:  ENV['STRIPE_WEBHOOK_SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
# StripeEvent.signing_secret = Rails.configuration.stripe[:signing_secret]

# if Rails.application.credentials[:stripe].present? && Rails.application.credentials[:stripe][:secret_key].present?
#   Stripe.api_key = Rails.application.credentials[:stripe][:secret_key]
# end

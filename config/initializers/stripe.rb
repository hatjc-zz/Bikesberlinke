if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_TaZ05b5m1BSQPuCJrCvBxyxV',
    secret_key: 'sk_test_ayKHPkQrx793avtySDTFjQT2'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]

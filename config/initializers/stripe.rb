if Rails.env.production?
  Stripe.api_key = "E1HDM7bLWhqZoEPI4GpLF6Fvw1mt9yip"
  STRIPE_PUBLISHABLE_KEY = "pk_ekRBTaRAS0XXrT3lHoO7g3uagduBh"
else
  Stripe.api_key = "2rwoxdBN9f9qwnjJfB9ghCZaS7YEPk91"
  STRIPE_PUBLISHABLE_KEY = "pk_WqMJushmmPvTmnz37zg4rYgaL73xw"
end

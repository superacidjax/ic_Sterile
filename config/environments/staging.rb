Icouch::Application.configure do
  config.cache_classes = true

  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.action_dispatch.x_sendfile_header = "X-Sendfile"

  config.cache_store = :dalli_store
  config.serve_static_assets = false

  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_url_options = { :host => 'icouch-staging.herokuapp.com' }

  ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => "icouch.me",
    :user_name            => ENV['GMAIL_USERNAME'],
    :password             => ENV['GMAIL_PASSWORD'],
    :authentication       => "plain",
    :enable_starttls_auto => true
  }

  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify
end

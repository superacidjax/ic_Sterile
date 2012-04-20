require File.expand_path('../boot', __FILE__)

require 'rails/all'

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module Icouch
  class Application < Rails::Application
    config.action_view.javascript_expansions[:defaults] = ['vendor/jquery', 'vendor/rails']
    config.encoding = "utf-8"
    config.filter_parameters += [:password]

    config.generators do |g|
      g.controller          :helper => false, :test_framework => false
      g.fixture_replacement :fabrication
      g.template_engine :haml
      g.test_framework :rspec
    end
  end
end

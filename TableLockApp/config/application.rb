require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TableLockApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    #uncomment this
    #config.web_console.whitelisted_ips = '173.0.82.126','112.135.6.253','112.135.5.36','61.245.161.11'
    config.middleware.use "PDFKit::Middleware", :print_media_type => true
  end
end

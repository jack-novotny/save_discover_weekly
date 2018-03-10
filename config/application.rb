require_relative 'boot'

require 'rails/all'
require 'rspotify'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

RSpotify::authenticate("5bd07298af28433896a3764eb6adfc96", "22aa74a02f5c46abacdba2f48e6963a4")

module SaveDiscoverWeekly
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end

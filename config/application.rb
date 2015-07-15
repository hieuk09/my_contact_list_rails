require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MyContactListRails
  class Application < Rails::Application
    config.i18n.default_locale = :vi
    config.autoload_paths += Dir[Rails.root.join('lib')]
  end
end

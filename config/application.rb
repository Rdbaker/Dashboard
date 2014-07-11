require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Dashboard
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework  :rspec, :fixture => false
      g.view_specs      false
      g.helper_specs    false
    end
  end
end

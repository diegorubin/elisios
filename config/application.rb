require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Elisios
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true

    # Bower asset paths
    root.join('lib', 'assets', 'bower_components').to_s.tap do |bower_path|
      config.sass.load_paths << bower_path
      config.assets.paths << bower_path
    end

  end
end

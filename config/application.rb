require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

RootUrl = "localhost:#{ENV["PORT"] || 3000}"

module DeployedTest
  class Application < Rails::Application
    config.logger = Logger.new(STDOUT)
    config.log_level = :debug
    config.active_record.raise_in_transactional_callbacks = true
  end
end

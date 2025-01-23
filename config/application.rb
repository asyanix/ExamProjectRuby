require_relative "boot"

require "rails/all"
require_relative "../lib/middleware/database_error_handler.rb"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GamesApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0
    config.middleware.use DatabaseErrorHandler
    config.after_initialize do
      begin
        ActiveRecord::Base.connection
      rescue ActiveRecord::NoDatabaseError
        Rails.logger.error "Database does not exist. Run migrations or check your configuration."
        abort("Database is not set up. Please run `rails db:setup`.")
      rescue PG::ConnectionBad => e
        Rails.logger.error "Could not connect to the database: #{e.message}"
        abort("Unable to connect to the database.")
      end
    end

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end

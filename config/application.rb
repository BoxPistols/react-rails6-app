require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
# require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ReactRails6App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # mailbox/activestorageを使わない
      initializer(:remove_action_mailbox_and_activestorage_routes, after: :add_routing_paths) { |app|
      app.routes_reloader.paths.delete_if {|path| path =~ /activestorage/}
      app.routes_reloader.paths.delete_if {|path| path =~ /actionmailbox/ }
    }

    config.generators do |g|
      g.stylesheets false   #styleシート
      g.javascripts false   #javascript
      g.helper false        #ヘルパー
      g.test_framework false #テストファイル
    end
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Don't generate system test files.
    config.generators.system_tests = nil
  end
end

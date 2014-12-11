module Refinery
  module LandingPages
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::LandingPages

      engine_name :refinery_landing_pages

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "landing_pages"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.landing_pages_admin_landing_pages_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/landing_pages/landing_page'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::LandingPages)
      end
    end
  end
end

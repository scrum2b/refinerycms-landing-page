module Refinery
  module Homes
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Homes

      engine_name :refinery_homes

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "homes"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.homes_admin_homes_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/homes/home'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Homes)
      end
    end
  end
end

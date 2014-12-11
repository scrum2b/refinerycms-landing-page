module Refinery
  module PageModules
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::PageModules

      engine_name :refinery_page_modules

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "page_modules"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.page_modules_admin_page_modules_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/page_modules/page_module'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::PageModules)
      end
    end
  end
end

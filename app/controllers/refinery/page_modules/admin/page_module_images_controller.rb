module Refinery
  module PageModules
    module Admin
      class PageModuleImagesController < ::Refinery::AdminController

        crudify :'refinery/page_modules/page_module_image',
                :xhr_paging => true

      end
    end
  end
end

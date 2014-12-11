module Refinery
  module PageModules
    class PageModuleImage < ActiveRecord::Base
      self.table_name = 'refinery_page_module_images'
      
      attr_accessible :page_module_id, :photo_id

      belongs_to :page_module, :class_name => 'Refinery::PageModules::PageModule', :foreign_key => :page_module_id
      belongs_to :photo, :class_name => '::Refinery::Image', :foreign_key => :photo_id
    end
  end
end
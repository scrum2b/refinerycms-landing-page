module Refinery
  module PageModules
    class PageModule < Refinery::Core::BaseModel
      self.table_name = 'refinery_page_modules'

      attr_accessible :title, :type_module, :body, :position
      has_many :page_module_images

      validates :title, :presence => true, :uniqueness => true
    end
  end
end

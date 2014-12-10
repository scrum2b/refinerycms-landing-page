module Refinery
  module Homes
    class ModuleImage < Refinery::Core::BaseModel
      self.table_name = 'refinery_module_images'

      belongs_to :home

      belongs_to :photo, :class_name => '::Refinery::Image'
    end
  end
end

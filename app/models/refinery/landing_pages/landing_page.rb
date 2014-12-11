module Refinery
  module LandingPages
    class LandingPage < Refinery::Core::BaseModel
      self.table_name = 'refinery_page_modules'

      attr_accessible :title, :type_module, :body, :position

      validates :title, :presence => true, :uniqueness => true
    end
  end
end

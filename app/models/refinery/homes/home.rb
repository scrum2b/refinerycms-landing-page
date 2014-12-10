module Refinery
  module Homes
    class Home < Refinery::Core::BaseModel
      self.table_name = 'refinery_homes'

      attr_accessible :title, :type_module, :content, :position

      validates :title, :presence => true, :uniqueness => true
    end
  end
end

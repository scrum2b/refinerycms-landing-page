module Refinery
  module LandingPages
    module Admin
      class LandingPagesController < ::Refinery::AdminController

        crudify :'refinery/landing_pages/landing_page',
                :xhr_paging => true

      end
    end
  end
end

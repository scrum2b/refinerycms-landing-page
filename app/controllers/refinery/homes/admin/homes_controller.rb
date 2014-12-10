module Refinery
  module Homes
    module Admin
      class HomesController < ::Refinery::AdminController

        crudify :'refinery/homes/home',
                :xhr_paging => true

        def new_big_slider
        	@home = Home.new
        end

        def new_small_slider
        	@home = Home.new
        end

      end
    end
  end
end

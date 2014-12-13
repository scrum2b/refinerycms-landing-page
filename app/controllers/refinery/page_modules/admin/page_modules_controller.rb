module Refinery
  module PageModules
    module Admin
      class PageModulesController < ::Refinery::AdminController

        crudify :'refinery/page_modules/page_module',
                :xhr_paging => true

        def new_big_slider
        	@page_module = PageModule.new
        	@page_module_image = PageModuleImage.new
        end

        def new_small_slider
        	@page_module = PageModule.new
        	@page_module_image = PageModuleImage.new
          @page_module_image1 = PageModuleImage.new
        end

        def save_small_slider
        	@page_module = PageModule.new( :title => params[:page_module][:title], :type_module => params[:page_module][:type_module] )
					if @page_module.valid? && @page_module.save
						@page_module_image = PageModuleImage.new( :page_module_id => @page_module.id, :photo_id => params[:page_module][:page_module_image][:photo_id] )
						@page_module_image.save if @page_module_image.valid? && params[:page_module][:page_module_image][:photo_id] != ""
						@page_module_image = PageModuleImage.new( :page_module_id => @page_module.id, :photo_id => params[:page_module][:page_module_image][:page_module_image][:photo_id] )
						@page_module_image.save if @page_module_image.valid? && params[:page_module][:page_module_image][:page_module_image][:photo_id] != ""
            @page_module_image = PageModuleImage.new( :page_module_id => @page_module.id, :photo_id => params[:page_module][:page_module_image][:page_module_image][:page_module_image][:photo_id] )
            @page_module_image.save if @page_module_image.valid? && params[:page_module][:page_module_image][:page_module_image][:page_module_image][:photo_id] != ""
						redirect_to "/refinery/page_modules"
					else
            if params[:page_module][:type_module] == "big slider"
              redirect_to "/refinery/page_modules/new_big_slider"
            else
              redirect_to "/refinery/page_modules/new_small_slider"
            end
					end

        end

      end
    end
  end
end

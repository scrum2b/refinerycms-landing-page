Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :page_modules do
    resources :page_modules, :path => '', :only => [:index, :show]
    resources :page_module_images
  end

  # Admin routes
  namespace :page_modules, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :page_modules, :except => :show do
        collection do
          post :update_positions

          get :new_big_slider
          get :new_small_slider

          post :save_small_slider
        end
      end
    end
  end

end

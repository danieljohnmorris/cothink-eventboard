CothinkEventboard::Application.routes.draw do |map|
  devise_for :admins
  devise_for :people
  
  match '/admin/events/ingest' => 'admin/events#ingest'
  match '/admin/events/hide(/:id(.:format))' => 'admin/events#hide', :as => :admin_event_hide
  match '/admin/events/publish(/:id(.:format))' => 'admin/events#publish', :as => :admin_event_publish
  match '/admin/events/bulk_publish((.:format))' => 'admin/events#bulk_publish', :as => :admin_events_bulk_publish
  
  map.namespace :admin do |admin|
    admin.index '/', :controller => 'index', :action => 'index'
    admin.resources :organisations
    admin.resources :events 
  end
    
  resources :organisations, :only => [:index, :show] do
    member do
      get :star
      get :unstar
    end

    collection do
      get :starred
    end
  end

  resources :events, :only => [:index, :show]  do
    member do
      get :star
      get :unstar
    end

    collection do
      get :starred
    end
  end
  
  map.root            :controller => 'home'
  map.about '/about', :controller => 'about'
  map.admin '/admin', :controller => 'admin'
  
  get "home/index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get :short
  #       post :toggle
  #     end
  #
  #     collection do
  #       get :sold
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get :recent, :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

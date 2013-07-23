TitsProj::Application.routes.draw do

  root :to => 'images#index'

  post 'admin/images/parse/create_image' => 'admin/images#create_parse_image' #for parsing
  post 'admin/images/parse' => 'admin/images#parse_images'#for create_img
  get  'admin/images/parse'
  post '/images/like' => 'images#like'#for likes
  post '/images/subscribe' => 'images#subscribe'#for subscribe
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :images, only: [:index] do
    resources :comments, only:[:create]
  end
  resources :events, only: [:index]
  get 'events/:user_id/navigation/' => 'events#navigation'
  get 'events/:user_id/sign_in/' => 'events#sign_in'
  get 'events/:user_id/sign_out/' => 'events#sign_out'
  get 'events/:user_id/likes/' => 'events#likes'
  get 'events/:user_id/comments/' => 'events#comments'

  resources :categories, only: [:index, :show] do
    resources :images, only: [:show]
  end
  devise_for :users, :controllers => {:registrations => "registrations", :sessions => "sessions"} do
    get '/auth/:provider/callback' => 'sessions#authf' # For socials networks
    resources :messages, only:[:create]
  end


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
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
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
  #       get 'recent', :on => :collection
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


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

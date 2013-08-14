TitsProj::Application.routes.draw do

  root :to => 'images#index'
  mount Resque::Server, :at => '/resque'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :admin do
    get '/events' => 'users#events'
    get '/users/:user_id/navigation/' => 'users#navigation'
    get '/users/:user_id/sign_in/' => 'users#sign_in'
    get '/users/:user_id/sign_out/' => 'users#sign_out'
    get '/users/:user_id/likes/' => 'users#likes'
    get '/users/:user_id/comments/' => 'users#comments'
    get  '/parse' => 'images#parse'
    post '/parse/create_image' => 'images#create_parse_image' #for parsing
    post '/parse' => 'images#parse_images'#for create_img
  end
  devise_for :users, :controllers => {:registrations => 'registrations', :sessions => 'sessions'} do
    get '/auth/:provider/callback' => 'sessions#authf' # For socials networks
    match '/auth/failure' => 'images#index'
  end
  resources :messages, only:[:create]
  resources :images, only: [:index] do
    post '/like' => 'images#like', on: :collection #for likes
    resources :comments, only:[:create]
  end
  resources :categories, only: [:index, :show] do
    post '/subscribe' => 'categories#subscribe', on: :collection #for subscribe
    resources :images, only: [:show] do
      resource :comments, only:[:create]
    end
  end
end

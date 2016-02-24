RailsGame::Application.routes.draw do



  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  get "search/index"

  get "search/list_games"

  get "search/list_tournaments"

  get "search/list_users"

  devise_for :users, controllers: {sessions: "users/sessions", registrations: "users/registrations",
                                   :omniauth_callbacks => "users/omniauth_callbacks"}
  devise_scope :user do
    authenticated :user do
      root to: 'tournaments#index'
    end
    unauthenticated do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  match 'profile'               => 'user#show',                 via: :get,    :as => 'show_user'
  match 'profile/update'        => 'user#edit',                 via: :get,    :as => 'edit_user'
  match 'profile/update'        => 'user#update',               via: :post,   :as => 'update_user'


  resources :tournaments, only: :index do
    collection do
      get :autocomplete
    end
  end

  resources :tournaments
  # custom routes
  match 'show_games/:id'        => 'tournaments#show_games',    via: :get,    :as => 'show_games'
  match 'show_games/:id'        => 'tournaments#add_game',      via: :put,    :as => 'add_game'
  match 'add_player'            => 'tournaments#add_player',    via: :post,   :as => 'add_player'
  match 'seed_tournament'       => 'tournaments#seed',          via: :post,   :as => 'seed_tournaments'
  match 'seed_players/:id'      => 'tournaments#seed_players',  via: :post,   :as => 'seed_players'


  # MATCH
  resources :matches

  match 'start_matches'     => 'matches#start_matches',     via: :post,   :as => 'start_matches'

  resources :games

  match 'seed_games'            => 'games#seed',                via: :post,   :as => 'seed_games'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   matches 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   matches 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # matches ':controller(/:action(/:id))(.:format)'
end

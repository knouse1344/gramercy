Rails.application.routes.draw do

  get 'main/index'
  get 'main/bryan'

  match '/christmas', to: 'main#christmas', via: 'get'
  match '/holiday', to: 'main#holiday', via: 'get'
  match '/hanukkah', to: 'main#hanukkah', via: 'get'

  resources :christmascards
  resources :users
  resources :websites
  resources :sessions, only: [:new, :create, :destroy]

  get "sessions/new"
  get "sessions/destroy"
  get 'sessions/new'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/signup', to: 'users#new', via: 'get'
  match '/dashboard', to: 'main#dashboard', via: 'get'


  match '/bryan' => 'users#show', :defaults => { :id => '1' }, via: 'get'
  match '/maya' => 'users#show', :defaults => { :id => '2' }, via: 'get'
  match '/preston' => 'users#show', :defaults => { :id => '3' }, via: 'get'
  match '/finn' => 'users#show', :defaults => { :id => '4' }, via: 'get'
  match '/adrian' => 'users#show', :defaults => { :id => '5' }, via: 'get'
  match '/jaden' => 'users#show', :defaults => { :id => '6' }, via: 'get'
  match '/vivian' => 'users#show', :defaults => { :id => '7' }, via: 'get'
  match '/maggie' => 'users#show', :defaults => { :id => '8' }, via: 'get'
  match '/zoie' => 'users#show', :defaults => { :id => '9' }, via: 'get'
  match '/bella' => 'users#show', :defaults => { :id => '10' }, via: 'get'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'main#index'


  resources :users do
    member do
      put :christmascard, :newsite
    end
  end
  resources :websites do
    member do
      put :colorfont, :colorback, :colorfoot
    end
  end

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

Rails.application.routes.draw do


  #todo: remove before go=live

  get 'user1' => 'static_pages#login'
  get 'generate' => 'static_pages#generate'

  get 'login' => 'sessions#new'
  post 'login'   => 'sessions#create'
  get 'register' => 'users#new'
  post 'users' => 'users#create'




  #root 'static_pages#variable_view'
  root 'public_pages#index'
  get '/id/:public_id' => 'public_pages#index'
  post '/' => 'public_pages#create'
  patch 'id/:public_id' => 'public_pages#update'
  put 'id/:public_id' => 'public_pages#update'


  get 'admin' => 'reservations#index'


  resources :reservations
  get 'reservations/email/:id' => 'reservations#email', as: :reservations_email


  resources :meals
  resources :groups
  resources :customers


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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

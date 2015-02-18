# this file defines the correspondence between URLs and web pages


Rails.application.routes.draw do

  

  resources :evaluations do
    resources :questions
    resources :users
  end

  resources :ratings

  devise_for :users
  get 'sessions/new'
  post 'sessions/create'
  delete 'sessions/destroy'

  get 'questions/show'

  get 'assignments/qlist'

  get 'questions/commentlist'

  get 'users/hwlist' # Anna made a route! 9 February 2015
  # we'll need another route here to get links going from hwlist page to the actual HW page for each student (which we haven't yet figure out the look of)

  resources :users do
    resources :memberships
    resources :groups
    resources :questions
  end

  resources :memberships


  resources :groups do
    resources :memberships
    resources :users
  end

  resources :assignments do 
    resources :questions
  end

  resources :questions do
    resources :ratings
    resources :evaluations
  end




  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index' 
  root to: "home#index" #homepage



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

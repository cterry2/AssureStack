Rails.application.routes.draw do
  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  
  post 'create_user' => 'user#create', :as => 'create_user'
  post "log_in" => "sessions#create", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"  
  get "sign_up" => "user#new", :as => "sign_up"  

  post "accountroles" => "user#updatekeywords", :as => "accountroles"
  get "account" => "user#accountinfo", :as => "account"
  post "upvote" => "issues#incrementvote", :as => "upvote"
  post "downvote" => "issues#decrementvote", :as => "downvote"
  get 'user/new'
  get 'sessions/new'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get 'issues/new' => 'issues#new', :as => "newIssue"
  post 'issues' => 'issues#create'
  get 'issues/:id' => 'issues#show'
  post 'answer' => 'issues#addanswer'
  get 'answer' => 'issues#answerlist'
  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  resources :user
  resources :session
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

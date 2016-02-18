ClassPortal::Application.routes.draw do
  resources :admins
  resources :courses
#  resources :application
#  resources :users
#  resources :sessions

  
  root 'static_pages#home'
  get 'sessions/new'
  get "static_pages/home"
  get "static_pages/admin"
  get "static_pages/instructor"
  get "static_pages/student"
  get "users/newInstructor"
  get "users/new"
  get "students/new"
  get "users/edit"
  
  get "courses/new"
  get "courses/view"
  get "courses/edit"
  get 'viewCourse' => 'courses#view'
  get 'editCourse' => 'courses#edit'
 
  get "students/view"
  get 'viewStudent' => 'students#view' 
 
  
  get 'addInst' =>'users#newInstructor'
  post 'createInstructor' =>'users#createInstructor'
  get 'signup'  => 'students#new'
  get 'edit' => 'users#edit'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :users
  resources :students
  resources :instructors
  resources :super_admins
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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

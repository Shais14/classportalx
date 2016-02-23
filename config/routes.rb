ClassPortal::Application.routes.draw do
  resources :user_histories
  resources :grades
  resources :admins
  resources :courses, :collection => {:requestEnrollment => :post}
#  resources :application
#  resources :users
#  resources :sessions

  
  root 'static_pages#home'
  get 'sessions/new'
  get "static_pages/home"
  get "static_pages/admin"
  get "static_pages/instructor"
  get "static_pages/student"
  #get "users/new"
  get "students/new"
  #get "users/edit"
  get "admins/new"
  get "super_admins/new"
  get "courses/new"
  get "courses/view"
  get "courses/edit"
  #get "courses/requestEnrollment"
  #get 'viewCourse' => 'courses#view'
  get 'viewCourse' => 'courses#view'
  
  
  
  
  
  
  get "/viewSelectCourse/:title/:number" => "courses#viewSelectCourse"
  post "/viewSelectCourse/:title/:number" => "courses#viewSelectCourse"
  
# /:course_instructor/:course_description/:course_status
  
  get 'searchCourse' => 'courses#searchCourse'
  
  get 'editCourse' => 'courses#edit'
  get 'enrollCourse/:id/enroll' => 'courses#enroll'
  post 'enrollCourse/:id/enroll' => 'courses#enroll'
 
  get "student_courses/viewHistory"
  get '/viewHistory/:id' => 'student_courses#viewHistory'
  post '/viewHistory/:id' => 'student_courses#viewHistory'
  
 
  get "students/view"
  get 'viewStudent' => 'students#view' 
 
  resources :courses do
  member do
    get 'enroll'
  end
end
  get 'addInst' =>'users#newInstructor'
  post 'createInstructor' =>'users#createInstructor'
  get 'editInst' => 'instructors#edit'
  get 'signup'  => 'students#new'
  get 'edit' => 'users#edit'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  get "/courses/:course_id/grades" => 'student_courses#grades'
  get "/courses/:course_id/requestEnrollment" => 'courses#requestEnrollment'
  get "/grades/new" => "student_courses#newGrade"
  post "/grades/new" => "student_courses#createGrade"
  
  get "/enrollmentRequests" => "student_courses#showEnrollmentRequests"
  get "/enrollmentRequests/courses/:course_id/students/:student_id/approve" => "student_courses#approveRequest"
  get "/enrollmentRequests/courses/:course_id/students/:student_id/deny" => "student_courses#denyRequest"

  
  get "/courses/:course_id/students" => "courses#students"
  get "/student_courses/:student_course_id/edit" => "grades#edit"
  
  get "/users/:user_id/history" => "user_histories#for_user"

  resources :users
  resources :students
  resources :instructors
  resources :super_admins
  resources :student_courses
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

Rails.application.routes.draw do
  get 'restaurant/index'
  root 'restaurant#index'

  get 'admin/index'
  root 'admin#index'
  get 'diner/index'
  root 'diner#index'

  get 'login/index'
  root 'login#index'

  get 'welcome/index'
  root 'welcome#index'
#when you have a model
  get 'login/signup_diner'  => 'users#new'
  resources :users
#when you dont have a model
  get '/login' => 'auth/login#login'
  post 'login'=>'auth/login#create'

  get '/signup_restaurant'=>'auth/signup#signup_restaurant'
  post '/restaurant_requests/add'=>'restaurant_requests#create'

  get '/admin/view_requests'=>'admin#view_requests'


  get 'signup_diner' => 'auth/signup#signup_diner'
  get 'signup_restaurant' => 'auth/signup#signup_restaurant'
  delete 'logout'=>'sessions#destroy'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

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
  get 'login/signup_diner'  => 'admin/users#new'

  get '/users'=>'auth/login#login'
  post '/users'=>'auth/users#create'

#when you dont have a model
  get '/login' => 'auth/login#login'
  post 'login'=>'auth/login#create'

  get '/signup_restaurant'=>'auth/signup#signup_restaurant'
  get '/restaurant_requests/add'=>'restaurant/restaurant_requests#create'

  get '/admin/view_requests'=>'admin/restaurant_requests#view_requests'
  get '/admin/accept'=>'admin/restaurant_requests#accept'
  get '/admin/reject'=>'admin/restaurant_requests#reject'

  get 'diner/home'=>'diner/home#home'
  get 'diner/profile'=>'diner/profile#view'
  get 'diner/reservation_history'=>'diner/past_reservations#past_reservations'
  get 'diner/reservations'=>'diner/reservations#reservations'
  post 'diner/profile/update'=>'diner/profile#update'

  get 'restaurant/home'=>'restaurant/home#home'
  get 'restaurant/profile'=>'restaurant/profile#profile'
  get 'restaurant/reservations'=>'restaurant/reservations#search_reservation'
  get 'restaurant/table_management'=>'restaurant/table_management'
  get 'restaurant/offers'=>'restaurant/offers#show'
  get 'restaurant/offer/new'=>'restaurant/offers#new'
  post '/restaurant/offer/add'=>'restaurant/offers#create'
  post '/restaurant/profile/update'=>'restaurant/profile#update'

  get 'signup_diner' => 'auth/signup#signup_diner'
  get 'signup_restaurant' => 'auth/signup#signup_restaurant'

  get 'reapply'=>'restaurant/home#reapply'

  delete 'logout'=>'sessions#destroy'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

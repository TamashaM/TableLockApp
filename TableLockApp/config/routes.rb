Rails.application.routes.draw do

  get 'restaurant/index'
  root 'diner/home#home'

  get 'admin/index'
  root 'admin#index'
  get 'diner/index'
  root 'diner#index'

  get 'login/index'
  root 'login#index'

  get 'welcome/index'
  root 'welcome#index'
#when you have a model
  get 'login/signup_diner'  => 'auth/signup#signup_diner'

  get '/users'=>'auth/login#login'
  post '/users'=>'auth/users#create'

#when you dont have a model
  get '/login' => 'auth/login#login'
  post 'login'=>'auth/login#create'

  get '/logout'=>'auth/login#destroy'

  get '/signup_restaurant'=>'auth/signup#signup_restaurant'
  get '/restaurant_requests/add'=>'restaurant/restaurant_requests#create'

  get '/admin/view_requests'=>'admin/restaurant_requests#view_requests'
  get '/admin/accept'=>'admin/restaurant_requests#accept'
  get '/admin/reject'=>'admin/restaurant_requests#reject'
  get '/admin/signup'=>'admin/profile#create'
  get 'admin/home'=>'admin/home#home'
  get '/admin/profile'=>'admin/profile#view'
  post '/admin/profile'=>'admin/profile#update'
  post '/admin/search'=>'admin/home#search'
  get '/admin/payments'=>'admin/payments#view'
  post '/admin/payments'=>'admin/payments#view'
  get '/admin/request_view'=>'admin/restaurant_requests#view'
  get 'admin/payments/print_report'=>'admin/payments#print_report'
  get '/admin/profile/change_pic'=>'admin/profile#change_pic'
  post '/admin/profile/change_pic'=>'admin/profile#change_pic'

  get '/diner/home'=>'diner/home#home'
  get 'diner/profile'=>'diner/profile#view'
  get 'diner/profile/restaurants'=>'diner/profile#profile'
  get 'diner/reservation_history'=>'diner/past_reservations#past_reservations'
  get 'diner/reservation_history/search'=>'diner/past_reservations#past_reservations'
  post 'diner/reservation_history/search'=>'diner/past_reservations#search'
  get '/diner/add_to_favourites'=>'diner/past_reservations#add_to_favourites'
  get 'diner/reservations'=>'diner/reservations#reservations'
  get '/diner/reservations/search'=>'diner/reservations#reservations'
  post '/diner/reservations/search'=>'diner/reservations#search'
  get '/diner/reservations/cancel'=>'diner/reservations#cancel'
  post 'diner/profile/update'=>'diner/profile#update'
  get 'diner/favourites'=>'diner/favourites#view'
  get 'diner/history'=>'diner/history#view'
  get '/diner/public_profile'=>'diner/public_profile#view'
  get 'diner/search_reservations'=>'diner/search_reservation#view'
  post 'diner/search_reservations'=>'diner/search_reservation#view'
  get 'diner/make_reservation'=>'diner/search_reservation#add'
  get 'diner/add_to_waiting_list'=>'diner/search_reservation#add_to_waiting_list'
  post 'diner/add_to_waiting_list'=>'diner/search_reservation#add_to_waiting_list'
  get '/diner/profile/change_pic'=>'diner/profile#change_pic'
  post '/diner/profile/change_pic'=>'diner/profile#change_pic'

  get '/search_reservation/index'=> 'diner/search_reservation#index'

  get 'restaurant/home'=>'restaurant/home#home'
  get 'restaurant/profile'=>'restaurant/profile#view'
  post 'restaurant/profile/update'=>'restaurant/profile#update'
  get 'restaurant/dining_information'=>'restaurant/dining_information#view'
  post 'restaurant/dining_information/add_meal_type'=>'restaurant/dining_information#add_meal_type'
  get 'restaurant/dining_information/remove_meal_type'=>'restaurant/dining_information#remove_meal_type'
  get 'restaurant/offers/remove'=>'restaurant/offers#remove'
  get 'restaurant/reservations/search'=>'restaurant/reservations#view_reservations'
  post 'restaurant/reservations/search'=>'restaurant/reservations#view_reservations'
  get 'restaurant/table_management/edit'=>'restaurant/table_management#edit'
  get 'restaurant/table_management/remove'=>'restaurant/table_management#remove'
  post 'restaurant/table_management/add'=>'restaurant/table_management#add'
  get 'restaurant/holidays/view'=>'restaurant/holidays#view'
  post 'restaurant/holidays/add'=>'restaurant/holidays#add'
  get '/restaurant/public_profile'=>'restaurant/public_profile#view'
  get '/restaurant/mark_status'=>'restaurant/reservations#mark_status'
  get '/restaurant/reservations/cancel'=>'restaurant/reservations#cancel'
  get '/restaurant/payments'=>'restaurant/payments#view'
  post '/restaurant/payments'=>'restaurant/payments#view'
  get '/restaurant/payments/print_report'=>'restaurant/payments#print_report'
  get '/restaurant/profile/change_pic'=>'restaurant/profile#change_pic'
  post '/restaurant/profile/change_pic'=>'restaurant/profile#change_pic'


  post '/reservation/create'=>'reservations#add'

  get 'restaurant/offers'=>'restaurant/offers#show'
  get 'restaurant/offer/new'=>'restaurant/offers#new'
  post '/restaurant/offer/add'=>'restaurant/offers#create'
  post '/restaurant/dining_information/update'=>'restaurant/dining_information#update'

  get 'signup_diner' => 'auth/signup#signup_diner'
  get 'signup_restaurant' => 'auth/signup#signup_restaurant'

  post '/reservations/:id' => "registrations#show"
  post '/hook' => 'reservations#hook'


  get 'reapply'=>'restaurant/home#reapply'
  get 'pending'=>'restaurant/home#pending'

  delete 'logout'=>'sessions#destroy'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

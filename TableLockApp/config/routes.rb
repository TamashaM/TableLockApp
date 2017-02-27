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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

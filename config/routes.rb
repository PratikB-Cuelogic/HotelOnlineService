Rails.application.routes.draw do

  get 'booking/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :members
  resources :search
  get 'home/index'
  get 'search/search'
  post 'search/search_list'
  root 'home#index'
  as :admin_user do
  	delete 'logout', to: 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

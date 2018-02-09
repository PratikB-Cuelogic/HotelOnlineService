Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :members
  get 'home/index'
  get 'search/search'
  get 'search/index'
  root 'home#index'
  as :admin_user do
  	delete 'logout', to: 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

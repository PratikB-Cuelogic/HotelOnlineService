Rails.application.routes.draw do

  get 'booking/index'
  root 'home#index'
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :members 
  
  resources :search  
  resources :booking
  
  get 'room_booked', to: 'booking#create'
  get 'booking_details',   to: 'booking#details'
  get 'home/index'
  get 'hotels_search',   to: 'search#search_hotels'
  get 'room_booking_confirmation',   to: 'search#search_list'


  as :admin_user do
  	delete 'logout', to: 'devise/sessions#destroy'
  end
end

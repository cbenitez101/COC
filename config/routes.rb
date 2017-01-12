Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  get 'profile/index'

  get 'restaurant/index'

  get 'menu/index'

  root to: 'welcome#index'
  get 'welcome/index'
  get 'reservation/index'
  get 'reservation/create'
  resources :profiles
  resources :reservation
   get '/menu/index', as: "menu"
  get '/restaurant/index', as: "restaurant"
  get '/franchise/index', as: "franchise"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

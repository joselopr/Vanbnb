Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # Draft with UI kitt
  get 'draft', to: 'pages#draft'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :vans do
   resources :bookings, only: [:create]
  end

  resources :bookings, only: [:show] do
    member do
      patch :accept
      patch :decline
    end
  end

  get 'my_dashboard', to: 'dashboard#my_dashboard'


end

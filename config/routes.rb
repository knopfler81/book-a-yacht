Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  get "/my_profile", to: "pages#my_profile"

  resources :yachts do
    resources :bookings, only:  [:new, :create]
  end

  resources :bookings, only: [:show, :edit, :update ] do
    resources :reviews, only: [:create]
  end

  mount Attachinary::Engine => "/attachinary"
end




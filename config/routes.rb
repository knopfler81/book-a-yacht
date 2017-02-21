Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :yachts, only: [:index, :show]
  
  	namespace :my do
  		resources :profiles, only: [:show, :edit, :update]
  		resources :yachts, only: [:new, :create, :edit, :update, :destroy]
  		resources :bookings, only: [:show, :edit, :update, :new, :create] do
  			resources :reviews, only: [:create]
  		end
  	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

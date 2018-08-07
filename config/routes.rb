Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users


  get '/signin', to: 'sessions#new', as: 'signin'
  
  resources :items do
    resources :deals, only: [:index, :show, :new, :create]
  end

  resources :deals

  resource :sessions, only: [:new, :create, :destroy]

  root 'static_pages#home'

  get '/auth/facebook/callback', to: 'sessions#create'
end

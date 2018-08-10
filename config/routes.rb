Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users


  get '/signin', to: 'sessions#new', as: 'signin'
  
  resources :items, only: [:show, :index] do
    resources :deals, only: [:show, :index, :new]
  end


  resources :items, only: [:new, :create, :edit, :update]
  resources :deals, only: [:index, :show, :new, :create, :edit, :update]

  resource :sessions, only: [:new, :create, :destroy]

  root 'static_pages#home'

  get '/auth/facebook/callback', to: 'sessions#create'
end

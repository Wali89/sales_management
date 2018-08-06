Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users


  get '/signin', to: 'sessions#new', as: 'signin'
  
  resources :items do
    resources :deals, only: [:index, :show, :create, :new]
  end

  #resources :deals

  #namespace :items do
  #  resources :deals, only: [:index, :show, :create]
  #end
  
  resource :sessions, only: [:new, :create, :destroy]


  #get '/items', to: 'items#index', as: 'items'
  #get '/items/new', to: 'items#new', as: 'new_item'
  #post '/items', to: 'items#create'
  #get '/items/:id', to: 'items#show', as: 'item' 
  #get '/items/:id/edit', to: 'items#edit', as: 'edit_item' 

  #get '/deals', to: 'deals#index', as: 'deals'
  #get '/deals/new', to: 'deals#new', as: 'new_deal'
  #post '/deals', to: 'deals#create'
  #get '/deals/:id', to: 'deals#show', as: 'deal'

  root 'static_pages#home'

  get '/auth/facebook/callback', to: 'sessions#create'
end

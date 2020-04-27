Rails.application.routes.draw do

  get '/', to: 'sessions#home', as: 'root', controller: 'sessions'

  get '/register', to: 'clients#new', as: 'register'
  resources :clients, only: [:create], path: 'register'
  resources :clients, only: [:show]
  
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create' 
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  get '/auth/:provider/callback', to: 'sessions#google'

  get '/most_popular_treatment/treatments/:id', to: 'treatments#show', as: 'most_popular_treatment'
 
  resources :treatments, only: [:index, :show] do 
    resources :appointments, only: [:index, :show]
  end 

  resources :clients, except: [:edit, :update, :destroy] do
    resources :appointments
  end 

  resources :appointments
  
  resources :appointments do
    resources :reviews, only: [:index]
  end
  
  resources :reviews, only: [:index, :new, :create] #shallow: true

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

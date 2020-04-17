Rails.application.routes.draw do

  get '/', to: 'sessions#home', as: 'root', controller: 'sessions'

  get '/register', to: 'clients#new', as: 'register'
  resources :clients, only: [:create], path: 'register'
  resources :clients, only: [:show, :index]
  
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create' 
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  get '/auth/:provider/callback', to: 'sessions#google'
 
  resources :treatments, only: [:index, :show] do 
    resources :appointments, only: [:index, :show]
  end 

  resources :clients do
    resources :appointments #(shallow: true)
  end 

  resources :appointments
  
  resources :appointments do
    resources :reviews
  end
  
  resources :reviews
  



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

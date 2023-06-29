Rails.application.routes.draw do

  root 'characters#index'

  resources :characters
  resources :publishers
  resources :origins

  resources :origins do
    member do
      get 'characters', to: 'characters#index'
    end
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

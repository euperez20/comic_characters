Rails.application.routes.draw do

  root 'characters#index'

  resources :characters
  resources :publishers
  resources :origins

  get 'origins/:id/characters', to: 'origins#characters_by_origin', as: 'characters_by_origin'

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

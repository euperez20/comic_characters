Rails.application.routes.draw do

  root 'characters#index'

  resources :characters
  resources :publishers
  resources :origins
  

  get 'origins/:id/characters', to: 'origins#characters_by_origin', as: 'characters_by_origin'

  get 'characters/by_publisher/:id', to: 'characters#by_publisher', as: 'characters_by_publisher'

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

Rails.application.routes.draw do

  root 'characters#index'

  resources :characters
  resources :publishers
  resources :origins
  resources :powers


  get 'origins/:id/characters', to: 'origins#characters_by_origin', as: 'characters_by_origin'

  get 'characters/by_publisher/:id', to: 'characters#by_publisher', as: 'characters_by_publisher'

  get '/characters_by_power/:power_id', to: 'characters#by_power', as: 'characters_by_power'

  get '/about', to: 'pages#about'

  resources :powers do
    get 'characters', to: 'characters#index', on: :member
  end

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

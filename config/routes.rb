Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/manufacturers', to: 'manufacturers#index'
  get '/manufacturers/:id', to: 'manufacturers#show'
  get '/bicycles', to: 'bicycles#index'
  get '/authors', to: 'authors#index'
  get '/authors/:id', to: 'authors#show'
  get '/books', to: 'books#index'
end

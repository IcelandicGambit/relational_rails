Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/manufacturers', to: 'manufacturers#index'
  get '/manufacturers/new', to: 'manufacturers#new'
  post '/manufacturers', to: 'manufacturers#create'
  get '/manufacturers/:id', to: 'manufacturers#show'
  get '/manufacturers/:id/bicycle_listing', to: 'manufacturers#bicycle_listing'
  get '/bicycles/', to: 'bicycles#index'
  get '/bicycles/:id', to: 'bicycles#show'
  get '/authors', to: 'authors#index'
  get '/authors/:id', to: 'authors#show'
  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'
  get '/authors/:id/book_listing', to: 'authors#book_listing'
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/manufacturers', to: 'manufacturers#index'
  get '/manufacturers/new', to: 'manufacturers#new'
  get '/manufacturers/:id/edit', to: 'manufacturers#edit'
  patch '/manufacturers/:id', to: 'manufacturers#update'
  post '/manufacturers', to: 'manufacturers#create'
  get '/manufacturers/:id', to: 'manufacturers#show'
  get '/manufacturers/:id/bicycle_listing', to: 'manufacturers#bicycle_listing'
  get '/manufacturers/:id/bicycle_listing/sorted', to: 'manufacturers#sorted'
  get '/manufacturers/:id/bicycle_listing/new', to: 'bicycles#new'
  post '/manufacturers/:id/bicycle_listing', to: 'bicycles#create'
  get '/bicycles/', to: 'bicycles#index'
  get '/bicycles/:id', to: 'bicycles#show'
  get '/bicycles/:id/edit', to: 'bicycles#edit'
  patch '/bicycles/:id', to: 'bicycles#update'


  get '/authors', to: 'authors#index'
  get '/authors/new', to: 'authors#new'
  get '/authors/:id/edit', to: 'authors#edit'
  patch '/authors/:id', to: 'authors#update'
  post '/authors', to: 'authors#create'
  get '/authors/:id/book_listing/new', to: 'books#new'
  post '/authors/:id/book_listing', to: 'books#create'
  get '/authors/:id', to: 'authors#show'
  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'
  get '/authors/:id/book_listing', to: 'authors#book_listing'
end

#manufactures#add could be create action
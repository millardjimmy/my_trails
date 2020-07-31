Rails.application.routes.draw do
  root 'welcome#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  get '/new', to: 'trails#new'
  post '/new', to: 'trails#create'

  get '/:id/edit', to: "trails#edit"
  patch '/:id', to: "trails#update"

  resources :trail do 
    resources :comments
  end 
  resources :trails
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

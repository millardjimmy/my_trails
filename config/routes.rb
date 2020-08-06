Rails.application.routes.draw do
  root 'welcome#home'
  get '/trails/most_popular', to: 'trails#most_popular'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  

  get '/:id/edit', to: "trails#edit"
  patch '/:id', to: "trails#update"

  get '/trails/:trail_id/comments/:id/edit(.:format)', to: "comments#edit"
  patch '/trails/:trail_id/comments/:id(.:format)', to: "comments#update"

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  
  

  resources :trails do 
    resources :comments, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end
  resources :trails
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

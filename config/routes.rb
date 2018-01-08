Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'session/new'
  get 'users/new'
  root 'static_pages#home'
  get '/books', to: 'static_pages#books'
  get '/help', to: 'static_pages#help'
  get '/development', to: 'static_pages#dev'
  get '/business', to: 'static_pages#bus'
  get '/it-software', to: 'static_pages#it'
  get '/health-fitness', to: 'static_pages#fit'
  get '/lifestyle', to: 'static_pages#ls'
  get '/about',to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
 resources :users
 resources :account_activations, only: [:edit]
 resources :password_resets,     only: [:new, :create, :edit, :update]
 resources :microposts,          only: [:create, :destroy]
end

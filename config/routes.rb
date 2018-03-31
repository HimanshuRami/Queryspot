Rails.application.routes.draw do


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'session/new'
  get 'users/new'
  root 'static_pages#home'
  get '/compdept', to: 'static_pages#compdept'
  get '/itdept', to: 'static_pages#itdept'
  get '/ecdept', to: 'static_pages#ecdept'
  get '/proddept', to: 'static_pages#proddept'
  get '/civildept', to: 'static_pages#civildept'
  get '/mechdept', to: 'static_pages#mechdept'
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
  get '/topics', to: 'topics#index'
  post '/topics', to: 'topics#create'
  get '/subscribe_user', to: 'users#subscribe_user'
  post '/subscribe_user', to: 'users#create_subscribe_user'
    resources :users do
    member do
      get :following, :followers
      # get :subscribe_user
    end
  end

   resources :ebooks, only: [:index, :new, :create, :destroy]
  #get '/ebooks', to: "ebooks#index"
  get 'ebooks/index'
  get 'ebooks/new'
  get 'ebooks/create'
  get 'ebooks/destroy'
  
  get 'desciplines/book_list', to: 'desciplines#book_list'
  resources :desciplines
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  
  resources :question_ces,        only: [:create, :destroy, :index] do
    member do
    put "like", to: "question_ces#upvote"
    put "dislike", to: "question_ces#downvote"
  end
end
  resources :microposts,          only: [:create, :destroy, :index] do
    member do
    put "like", to: "microposts#upvote"
    put "dislike", to: "microposts#downvote"
  end
end
  resources :comments,            only: [:new, :index, :destroy] do
    member do
    put "like", to: "comments#upvote"
    put "dislike", to: "comments#downvote"
  end 
end 
  
  post '/comments', to: 'comments#create', as: 'create_comment'
  
  resources :answers,             only: [:new, :index, :destroy] do   
    member do
    put "like", to: "answers#upvote"
    put "dislike", to: "answers#downvote"
  end
end
  post '/answers', to: 'answers#create', as: 'create_answer'    
  resources :relationships,       only: [:create, :destroy]

end
